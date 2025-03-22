$(document).ready(() => {

    function createRow(sneakers) {
        $(".t-body").empty(); // Nettoie le tableau avant d'ajouter les nouvelles lignes

        sneakers.forEach(sneaker => {
            let tr = $("<tr></tr>");

            tr.append($("<td></td>").text(sneaker.brand));
            tr.append($("<td></td>").text(sneaker.size));
            tr.append($("<td></td>").text(sneaker.color));
            tr.append($("<td></td>").text(sneaker.states));
            tr.append($("<td></td>").text(sneaker.price));
            tr.append($("<td></td>").text(sneaker.stock));
            let img = $("<img>").attr("src", "../../asset/product_img/" + sneaker.image).attr("alt", "Sneaker Image").css({ width: "50px", height: "50px" });
            tr.append($("<td></td>").append(img));


            let editBtn = $("<button class='btn-edit'>Modifier</button>").click(() => editSneaker(sneaker));
            let deleteBtn = $("<button class='btn-delete'>Supprimer</button>").click(() => deleteSneaker(sneaker.sneakers_id));

            tr.append($("<td></td>").append(editBtn, deleteBtn));

            $(".t-body").append(tr);
        });
    }

    function deleteSneaker(sneakerId) {
        if (confirm("Voulez-vous vraiment supprimer cette sneaker ?")) {
            $.ajax({
                url: "sneakers_admin.php",
                type: "POST",
                dataType: "json",
                data: { opt: "delete_id", sneakers_id: sneakerId },
                success: (response) => {
                    if (response.success) {
                        alert("Sneaker supprimée avec succès !");
                        loadSneakers();
                    } else {
                        alert("Erreur lors de la suppression.");
                    }
                },
                error: (xhr, status, error) => {
                    console.error("Erreur AJAX:", error);
                }
            });
        }
    }

    function editSneaker(sneaker) {
        // Suppression d'un éventuel formulaire existant
        $(".edit-form").remove();
        
        let form = $(`
            <div class="edit-form">
                <h3>Modifier la sneaker</h3>
                <label>Marque :</label>
                <input type="text" id="edit-brand" value="${sneaker.brand}">
                <label>Taille :</label>
                <input type="text" id="edit-size" value="${sneaker.size}">
                <label>Couleur :</label>
                <input type="text" id="edit-color" value="${sneaker.color}">
                <label>État :</label>
                <input type="text" id="edit-state" value="${sneaker.states}">
                <label>Prix :</label>
                <input type="number" id="edit-price" value="${sneaker.price}">
                <label>Stock :</label>
                <input type="number" id="edit-stock" value="${sneaker.stock}">
                <label for="editImage">Image :</label>
                <input type="file" id="editImage" accept="image/*">
                <button class="btn-save">Sauvegarder</button>
                <button class="btn-cancel">Annuler</button>
            </div>
        `);

        $("body").append(form);

        $(".btn-cancel").click(() => {
            $(".edit-form").remove();
        });

        $(".btn-save").click(() => {
            let formData = new FormData();
            
            formData.append("opt", "update_id"); // Ajout de l'option de mise à jour
            formData.append("sneakers_id", sneaker.sneakers_id);
            formData.append("brand", $("#edit-brand").val());
            formData.append("size", $("#edit-size").val());
            formData.append("color", $("#edit-color").val());
            formData.append("states", $("#edit-state").val()); // Corrigé "state" en "states" si c'est le bon champ côté PHP
            formData.append("price", $("#edit-price").val());
            formData.append("stock", $("#edit-stock").val());
        
            // Vérification et ajout du fichier image s'il est sélectionné
            let imageFile = $("#editImage")[0].files[0];
            if (imageFile) {
                formData.append("image", imageFile);
            }
            console.log(formData);
            $.ajax({
                url: "sneakers_admin.php",
                type: "POST",
                dataType: "json",
                data: formData,
                contentType: false,  // Important pour envoyer des fichiers
                processData: false,  // Empêche jQuery de transformer FormData en string
                success: (response) => {
                    if (response.success) {
                        alert("Sneaker mise à jour avec succès !");
                        $(".edit-form").remove();
                        loadSneakers();
                    } else {
                        alert("Erreur lors de la mise à jour: " + response.error);
                    }
                },
                error: (xhr, status, error) => {
                    console.error("Erreur AJAX:", error);
                }
            });
        });
    }        
    function loadSneakers() {
        $.ajax({
            url: "sneakers_admin.php",
            type: "GET",
            dataType: "json",
            data: { opt: "select" },
            success: (response) => {
                if (response.success) {
                    createRow(response.sneakers);
                } else {
                    alert("Erreur de récupération des sneakers.");
                }
            },
            error: (xhr, status, error) => {
                console.error("Erreur AJAX:", error);
            }
        });
    }

    // Charger les sneakers au chargement de la page
    loadSneakers();
});
