$(document).ready(function () {
    // Fonction pour charger la liste des articles dans le panier
    function loadShoppingList() {
        $.ajax({
            url: '../order_page/order.php', // URL de votre script PHP
            type: 'GET',
            data: { opt: 'select_shopping_list_by_users_id' }, // Action demandée
            dataType: 'json', // Type de données attendu
            success: function (response) {
                if (response.success) {
                    // Générer le HTML pour afficher la liste
                    let shoppingListHtml = '';                    
                    
                    // Vérifier si response.shopping_list est un tableau
                    if (Array.isArray(response.shopping_list)) {                       
                        if (response.shopping_list.length > 0) {
                            $.each(response.shopping_list, function (index, item) {
                                shoppingListHtml += `
                                    <div class="shopping-item">
                                        <img src="../asset/product_img/${item.image}" alt="${item.brand}" class="shopping-item-image">
                                        <h3>${item.brand}</h3>
                                        <p>Prix : ${item.price} €</p>
                                        <p>Stock : ${item.stock}</p>
                                    </div>
                                `;
                            });
                        } else {
                            shoppingListHtml = '<p>Votre panier est vide.</p>';
                        }
                    } else {
                        
                        const item = response.shopping_list; // On suppose que c'est un objet unique
                        shoppingListHtml += `
                            <div class="shopping-item">
                                <img src="../asset/product_img/${item.image}" alt="${item.brand}" class="shopping-item-image">
                                <h3>${item.brand}</h3>
                                <p>Prix : ${item.price} €</p>
                                <p>Stock : ${item.stock}</p>
                            </div>
                        `;
                    }
                
                    // Insérer dans le conteneur
                    $('#shopping-list').html(shoppingListHtml);
                } else {
                    console.log(response)
                    // alert(response.msg || 'Une erreur est survenue.');
                }
                
            },
            error: function () {
                alert('Erreur de connexion au serveur.');
            }
        });
    }

    // Charger la liste au chargement de la page
    loadShoppingList();
});

$(document).ready(function () {
    // Charger les informations utilisateur
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
            error: function () {
                alert("Erreur de connexion avec le serveur.");
            }
        });
    }

    // Mettre à jour les informations utilisateur
    $('#updateUserForm').on('submit', function (e) {
        e.preventDefault();
        const formData = $(this).serialize();
        $.ajax({
            url: 'users.php',
            type: 'POST',
            data: { opt: 'update_user', ...formData },
            dataType: 'json',
            success: function (response) {
                alert(response.msg || "Mise à jour réussie !");
                if (response.success) {
                    loadUserInfo();
                }
            },
            error: function () {
                alert("Erreur de connexion avec le serveur.");
            }
        });
    });

    // Supprimer l'utilisateur
    $('#deleteUserBtn').on('click', function () {
        if (confirm("Êtes-vous sûr de vouloir supprimer votre compte ?")) {
            $.ajax({
                url: 'users.php',
                type: 'POST',
                data: { opt: 'delete_user' },
                dataType: 'json',
                success: function (response) {
                    alert(response.msg || "Compte supprimé.");
                    if (response.success) {
                        window.location.href = "logout.php"; // Redirection après suppression
                    }
                },
                error: function () {
                    alert("Erreur de connexion avec le serveur.");
                }
            });
        }
    });

    // Charger les données au démarrage
    loadUserInfo();
});

$(document).ready(function () {
    // Quand on clique sur le bouton "Modifier"
    $("#update_btn").click(function () {
        // Récupérer les valeurs des champs du formulaire
        const userInfo = {
            firstname: $("#username_firstname").val(),
            lastname: $("#username_lastname").val(),
            email: $("#username_email").val(),
            username: $("#username").val(),
            password: $("#username_pwd").val()
        };

        $.ajax({
            url: '../users.php', // URL de votre script PHP
            type: 'POST',
            data: { 
                opt: 'update_user',
                firstname: userInfo.firstname,
                lastname: userInfo.lastname,
                email: userInfo.email,
                username: userInfo.username,
                password: userInfo.password,
             }, // Action demandée
            dataType: 'json', // Type de données attendu
            success: function (response) {
                if (response.success) {
                }
                
            },
            error: function () {
                alert('Erreur de connexion au serveur.');
            }
        });
    });
});

$(document).ready(function () {
    // Quand on clique sur le bouton "Supprimer votre compte"
    // Cibler le bouton "Supprimer votre compte"
    $("#delete_account").on("click", function () {
        // Afficher une boîte de dialogue de confirmation
        const confirmation = confirm("Êtes-vous sûr de vouloir supprimer votre compte ? Cette action est irréversible !");
    
        // Vérifier la réponse de l'utilisateur
        if (confirmation) {
            // Si l'utilisateur confirme, exécuter l'action (appel au serveur, par exemple)
            alert("Votre compte a été supprimé.");
            $.ajax({
                url: '../users.php', // URL de votre script PHP
                type: 'GET',
                data: { 
                    opt: 'delete_user'
                 }, // Action demandée
                dataType: 'json', // Type de données attendu
                success: function (response) {
                    if (response.success) {
                        window.location.replace("http://localhost/WWS/site/register/register.html");
                    }
                    
                },
                error: function () {
                    alert('Erreur de connexion au serveur.');
                }
            })
            // Redirection ou autre logique peut être ajoutée ici
        } else {
            // Si l'utilisateur annule
            alert("Suppression annulée.");
        }
    });
});

$("#command_btn").click(function (e) {
    e.preventDefault(); // Empêcher l'action par défaut du bouton

    // Vérifier si l'utilisateur est connecté
    let user = localStorage.getItem("user");
    let userObj = JSON.parse(user);  // Convertir la chaîne JSON en objet

    // Vérifier si le panier contient des articles
    let panierNonVide = $(".shopping-item").length > 0; // Vérifie si des articles sont présents

    if (userObj && userObj.users_id !== "undefined" && panierNonVide) {
        // Redirection vers la page de commande
        // window.location.href = "http://localhost/WWS/site/order_page/order.html";
        alert("Merci pour votre commande")
    } else {
        let message = "";
        if (!userObj || userObj.users_id === "undefined") message += "Vous devez être connecté.\n";
        if (!panierNonVide) message += "Votre panier est vide.\n";

        alert(message);
    }
});
