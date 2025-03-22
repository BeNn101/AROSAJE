$(document).ready(function () {
    // Fonction pour charger les articles
    function loadArticles() {
        $.ajax({
            url: '../sneakers.php',
            type: 'POST',
            data: { opt: 'select' },
            dataType: 'json',
            success: function (response) {
                if (response.success) {
                    var articlesHtml = '';
                    let user = localStorage.getItem("user");
                    let userObj = JSON.parse(user);  

                    $.each(response.articles, function (index, article) {
                        let isOwner = userObj.users_id === parseInt(article.users_id);
                        articlesHtml += ` 
                            <div class="sneaker-card" data-id="${article.sneakers_id}" data-users_id="${article.users_id}">
                                <h3>${article.brand}</h3>
                                <img src="../asset/product_img/${article.image}" alt="${article.brand}" class="sneaker-image">
                                
                                <p class="edit-size">Size : ${article.size}</p>
                                <p class="edit-color">Couleur : ${article.color}</p>
                                <p class="edit-brand">Marque : ${article.brand}</p>
                                <p class="edit-price">Prix : ${article.price} €</p>
                                <p class="edit-state">État : ${article.states}</p>
                                <p class="edit-stock">Stocks : ${article.stock}</p>

                                ${isOwner 
                                    ? `
                                        <button class="delete-sneaker" data-id="${article.sneakers_id}">🗑</button>
                                        <button class="modify-sneaker" data-id="${article.sneakers_id}">✏️</button>
                                    ` 
                                    : `<button class="add-to-cart" data-id="${article.sneakers_id}">Ajouter au panier</button>`
                                }
                            </div>
                        `;
                    });

                    $("#catalogue").html(articlesHtml); 
                } else {
                    $('#catalogue').html('<p>Aucun article trouvé.</p>');
                }
            },
            error: function () {
                alert('Une erreur est survenue lors du chargement des articles.');
            }
        });
    }

    // Appel initial du chargement des articles
    loadArticles();

    // Ouvrir la modal pour modification
    $(document).on("click", ".modify-sneaker", function() {
        let card = $(this).closest(".sneaker-card");
        let sneakerId = $(this).data("id");

        // Extraction des valeurs depuis la carte
        let brand = card.find("h3").text().trim();
        let size = card.find(".edit-size").text().replace("Size : ", "").trim();
        let color = card.find(".edit-color").text().replace("Couleur : ", "").trim();
        let brandName = card.find(".edit-brand").text().replace("Marque : ", "").trim();
        let price = card.find(".edit-price").text().replace("Prix : ", "").replace("€", "").trim();
        let state = card.find(".edit-state").text().replace("État : ", "").trim();
        let stock = card.find(".edit-stock").text().replace("Stocks : ", "").trim();

        // Remplissage du formulaire dans la modal
        $("#sneakerId").val(sneakerId);
        $("#editBrand").val(brand);
        $("#editSize").val(size);
        $("#editColor").val(color);
        $("#editBrandName").val(brandName);
        $("#editPrice").val(price);
        $("#editState").val(state);
        $("#editStock").val(stock);

        // Affichage de la modal
        $("#editModal").fadeIn();
    });

    // Fermer la modal
    $(".close").click(function() {
        $("#editModal").fadeOut();
    });

   // Envoi des modifications en AJAX
$("#editForm").submit(function(e) {
    e.preventDefault(); // Empêche le rechargement de la page

    let formData = new FormData();
    formData.append("opt", "update_id");
    formData.append("sneakers_id", $("#sneakerId").val());
    formData.append("brand", $("#editBrand").val());
    formData.append("size", $("#editSize").val());
    formData.append("color", $("#editColor").val());
    formData.append("price", $("#editPrice").val());
    formData.append("states", $("#editState").val());
    formData.append("stock", 1);

    // Vérification et ajout du fichier image s'il est sélectionné
    let imageFile = $("#editImage")[0].files[0];
    if (imageFile) {
        formData.append("image", imageFile);
    }

    $.ajax({
        url: "../sneakers.php",
        type: "POST",
        data: formData,
        contentType: false, // Nécessaire pour envoyer des fichiers
        processData: false, // Empêche jQuery de transformer FormData en string
        dataType: "json",
        success: function(response) {
            if (response.success) {
                console.log(response);
                alert("Modifications enregistrées !");
                $("#editModal").fadeOut();
                loadArticles(); // Recharger les sneakers après modification
            } else {
                alert("Erreur : " + response.error);
            }
        },
        error: function(xhr, status, error) {
            console.log("XHR Response:", xhr.responseText);
            console.log("Status:", status);
            console.log("Error:", error);
            alert("Erreur de connexion avec le serveur.");
        }        
        
    });
});

$(document).on("click", ".add-to-cart", function() {
    let sneakers_id = $(this).data("id");

    // Récupération du users_id depuis le parent contenant la classe "sneaker-card"
    let users_id = $(this).closest(".sneaker-card").data("users_id");

    // Stockage dans le localStorage
    if (users_id) {
        localStorage.setItem("users_id_shopping_list", users_id);
    }

    $.ajax({
        url: "../sneakers.php",
        type: "POST",
        data: { opt: "add_to_cart", sneakers_id: sneakers_id },
        dataType: "json",
        success: function(response) {
            if (response.success) {
                alert("Produit ajouté au panier avec succès !");
            } else {
                alert("Erreur : " + response.error);
            }
        },
        error: function() {
            alert("Erreur de connexion avec le serveur.");
        }
    });
});


    // Supprimer une sneaker
    $(document).on('click', '.delete-sneaker', function () {
        const productId = $(this).data('id');

        // Confirmer la suppression avant d'effectuer l'appel Ajax
        if (confirm("Voulez-vous vraiment supprimer cette sneaker ?")) {
            $.ajax({
                url: '../sneakers.php',
                type: 'POST',
                data: { opt: 'delete_id', sneakers_id: productId },
                dataType: 'json',
                success: function (response) {
                    if (response.success) {
                        alert('Sneaker supprimée avec succès !');
                        loadArticles(); // Recharger les articles après suppression
                    } else {
                        alert('Une erreur est survenue : ' + response.error);
                    }
                },
                error: function () {
                    alert('Erreur de connexion au serveur.');
                }
            });
        }
    });
});
