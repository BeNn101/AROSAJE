$(document).ready(function () {

    /*** CHARGEMENT DES INFORMATIONS UTILISATEUR ***/
    function loadUserInfo() {
        $.ajax({
            url: '../users.php',
            type: 'GET',
            data: { opt: 'select_user' },
            dataType: 'json',
            success: function (response) {
                if (response.success && response.user) {
                    const user = response.user;
                    $('#username_firstname').val(user.firstname);
                    $('#username_lastname').val(user.lastname);
                    $('#username_email').val(user.email);
                    $('#username').val(user.user_name);
                } else {
                    alert(response.msg || "Erreur de récupération des informations utilisateur.");
                }
            },
            error: function (xhr, status, error) {
                console.log("XHR:", xhr);
                console.log("Status:", status);
                console.log("Error:", error);
                alert("Erreur lors de la commande.");
            }
            
        });
    }

    loadUserInfo();

    /*** MODIFICATION DES INFORMATIONS UTILISATEUR ***/
    $("#update_btn").click(function () {
        const userInfo = {
            firstname: $("#username_firstname").val(),
            lastname: $("#username_lastname").val(),
            email: $("#username_email").val(),
            username: $("#username").val(),
            password: $("#username_pwd").val()
        };

        $.ajax({
            url: '../users.php',
            type: 'POST',
            data: {
                opt: 'update_user',
                ...userInfo
            },
            dataType: 'json',
            success: function (response) {
                if (response.success) {
                    alert("Informations mises à jour !");
                }
            },
            error: function () {
                alert('Erreur de connexion au serveur.');
            }
        });
    });

    /*** SUPPRESSION DU COMPTE UTILISATEUR ***/
    $("#delete_account").on("click", function () {
        if (confirm("Êtes-vous sûr de vouloir supprimer votre compte ? Cette action est irréversible !")) {
            $.ajax({
                url: '../users.php',
                type: 'GET',
                data: { opt: 'delete_user' },
                dataType: 'json',
                success: function (response) {
                    if (response.success) {
                        window.location.replace("http://localhost/WWS/site/register/register.html");
                    }
                },
                error: function () {
                    alert('Erreur de connexion au serveur.');
                }
            });
        } else {
            alert("Suppression annulée.");
        }
    });

    /*** CHARGER LA LISTE DES ARTICLES DU PANIER ***/
    function loadShoppingList() {
        $.ajax({
            url: '../order_page/order.php',
            type: 'GET',
            data: { opt: 'select_shopping_list_by_users_id' },
            dataType: 'json',
            success: function (response) {
                let shoppingListHtml = '';
                if (response.success) {
                    if (Array.isArray(response.shopping_list) && response.shopping_list.length > 0) {
                        $.each(response.shopping_list, function (index, item) {
                            shoppingListHtml += `
                                <div id="order-summary" class="shopping-item" data-sneaker-id="${item.sneakers_id}" data-sellers-id="${item.users_id}" data-quantity="${item.stock}" data-price="${item.price}">
                                    <img src="../asset/product_img/${item.image}" alt="${item.brand}" class="shopping-item-image">
                                    <h3>${item.brand}</h3>
                                    <p class="price">Prix : ${item.price} €</p>
                                    <button class="delete-item-btn">Supprimer</button>
                                </div>
                            `;
                        });
                    } else {
                        shoppingListHtml = '<p>Votre panier est vide.</p>';
                    }
                } else {
                    console.error("Erreur de récupération du panier :", response.msg);
                }
            
                $('#shopping-list').html(shoppingListHtml);
            },
            
            error: function () {
                alert('Erreur de connexion au serveur.');
            }
        });
    }
    
    loadShoppingList(); // Chargement au démarrage

});

$("#command_btn").on("click", function(e) {
    e.preventDefault();

    var currentDate = new Date();
    var formattedDate = currentDate.toISOString().split('T')[0];
    var userDataShoppingList = JSON.parse(localStorage.getItem('users_id_shopping_list'));

    var buyer_id = userDataShoppingList;
    var commandesPassées = [];

    $(".shopping-item").each(function () {
        let sneaker_id = $(this).data('sneaker-id');
        let seller_id = $(this).data('sellers-id');
        let price = $(this).data('price');
        let nom = $(this).find('h3').text();

        var fd = new FormData();
        fd.append('opt', 'insert');
        fd.append('status', 'en cours de préparation');
        fd.append('order_date', formattedDate);
        fd.append('buyer_id', buyer_id);
        fd.append('nom', nom);
        fd.append('price', price);
        fd.append('sneaker_id', sneaker_id);
        fd.append('seller_id', seller_id);

        $.ajax({
            url: "../order_page/order.php",
            type: "POST",
            data: fd,
            contentType: false,
            processData: false,
            cache: false,
            success: function(response) {
                var data = JSON.parse(response);
                if (data.success) {
                    commandesPassées.push({
                        nom: nom,
                        prix: price,
                        statut: "en cours de préparation"
                    });
                } else {
                    console.warn("Erreur commande : " + nom, data.msg);
                }

                // Quand toutes les commandes sont passées, vider le panier
                if (commandesPassées.length === $(".shopping-item").length) {
                    alert("Merci pour votre commande")
                    viderPanierEtAfficherResume(buyer_id, commandesPassées);
                }
            },
            error: function(xhr, status, error) {
                console.error("Erreur AJAX :", xhr.responseText);
            }
        });
    });
});

function viderPanierEtAfficherResume(user_id, commandes) {
    $.ajax({
        url: "../order_page/order.php",
        type: "POST",
        data: {
            opt: "empty_shopping_list",
            user_id: user_id
        },
        success: function(response) {
            var data = JSON.parse(response);
            if (data.success) {
                // Vider l'affichage du panier
                $('#shopping-list').html('<p>Votre panier est maintenant vide.</p>');

                // Afficher les commandes passées
                let resumeHtml = '<h3>Résumé de votre commande :</h3><ul>';
                commandes.forEach(function(cmd) {
                    resumeHtml += `<li><strong>${cmd.nom}</strong> – ${cmd.prix} € – <em>${cmd.statut}</em></li>`;
                });
                resumeHtml += '</ul>';

                $('#order-summary').html(resumeHtml);
            } else {
                alert("Erreur lors de la suppression du panier : " + data.msg);
            }
        },
        error: function(xhr, status, error) {
            console.error("Erreur AJAX :", xhr.responseText);
        }
    });
}

// Délégation d'événement après chargement dynamique
$(document).on("click", ".delete-item-btn", function () {
    const $itemDiv = $(this).closest('.shopping-item');
    const sneakerId = $itemDiv.data('sneaker-id');
    const userData = JSON.parse(localStorage.getItem('user'));

    if (!(userData && userData.users_id)) {
        alert("Utilisateur non identifié.");
        return;
    }

    $.ajax({
        url: '../order_page/order.php',
        type: 'POST',
        data: {
            opt: 'delete_item_from_shopping_list',
            user_id: userData.users_id,
            sneaker_id: sneakerId
        },
        success: function(response) {
            const res = JSON.parse(response);
            if (res.success) {
                // Retirer l'élément du DOM
                localStorage.removeItem("users_id_shopping_list");
                $itemDiv.remove();

                // Affichage facultatif si panier vide
                if ($('.shopping-item').length === 0) {
                    $('#shopping-list').html('<p>Votre panier est vide.</p>');
                }
            } else {
                alert("Erreur : " + res.msg);
            }
        },
        error: function(xhr) {
            console.error("Erreur AJAX :", xhr.responseText);
        }
    });
});

$(document).ready(function() {
    let userData = localStorage.getItem("user");
if (userData) {
    try {
        let user = JSON.parse(userData);
        let users_id = user.users_id;

        // Utilisation dans l'appel AJAX
        $.ajax({
            url: "../order_page/order.php",
            type: "POST",
            data: {
                opt: "select_user",
                users_id: users_id
            },
            dataType: "json",
            success: function(response) {
                if (response.success) {
                    let orders = response.orders;
                    console.log("Commandes :", orders);

                    let html = "";
                    orders.forEach(order => {
                        html += `<div class="order">
                            <p><strong>Commande n°</strong> ${order.order_id}</p>
                            <p>nom: ${order.nom}</p>
                            <p>Date : ${order.date_de_commande}</p>
                            <p>Prix : ${order.price}</p>
                            <p>Etat de la commande : ${order.etat_c}</p>
                        </div>`;
                    });
                    $("#user-orders").html(html);

                } else {
                    console.log("pas de commande en cours");
                }
            },
            error: function() {
                alert("Erreur lors de la récupération des commandes.");
            }
        });

    } catch (e) {
        console.error("Erreur de parsing JSON :", e);
    }
} else {
    alert("Aucune donnée utilisateur trouvée dans le localStorage.");
}
});

