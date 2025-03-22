$(document).ready(() => {
    
    function createRow(users) {
        $("#user-table").empty(); // Nettoie le tableau avant d'ajouter les nouvelles lignes

        users.forEach(user => {
            let tr = $("<tr></tr>");

            tr.append($("<td></td>").text(user.firstname));
            tr.append($("<td></td>").text(user.lastname));
            tr.append($("<td></td>").text(user.user_name));
            tr.append($("<td></td>").text(user.email));
            tr.append($("<td></td>").text(user.newsletter ? "Oui" : "Non"));

            let editBtn = $("<button class='btn-edit'>Modifier</button>").click(() => editUser(user));
            let deleteBtn = $("<button class='btn-delete'>Supprimer</button>").click(() => deleteUser(user.users_id));

            tr.append($("<td></td>").append(editBtn));
            tr.append($("<td></td>").append(deleteBtn));

            $("#user-table").append(tr);
        });
    }

    function deleteUser(userId) {
        if (confirm("Voulez-vous vraiment supprimer cet utilisateur ?")) {
            $.ajax({
                url: "users_admin.php",
                type: "POST",
                dataType: "json",
                data: { opt: "delete", users_id: userId },
                success: (response) => {
                    if (response.success) {
                        alert("Utilisateur supprimé avec succès !");
                        location.reload();
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

    function editUser(user) {
        // Suppression d'un éventuel formulaire existant
        $(".edit-form").remove();

        let form = $(`
            <div class="edit-form">
                <h3>Modifier l'utilisateur</h3>
                <label>Prénom :</label>
                <input type="text" id="edit-firstname" value="${user.firstname}">
                <label>Nom :</label>
                <input type="text" id="edit-lastname" value="${user.lastname}">
                <label>Nom d'utilisateur :</label>
                <input type="text" id="edit-username" value="${user.user_name}">
                <label>Email :</label>
                <input type="email" id="edit-email" value="${user.email}">
                <label>Newsletter :</label>
                <select id="edit-newsletter">
                    <option value="1" ${user.newsletter ? "selected" : ""}>Oui</option>
                    <option value="0" ${!user.newsletter ? "selected" : ""}>Non</option>
                </select>
                <button class="btn-save">Sauvegarder</button>
                <button class="btn-cancel">Annuler</button>
            </div>
        `);

        $("body").append(form);

        $(".btn-cancel").click(() => {
            $(".edit-form").remove();
        });

        $(".btn-save").click(() => {
            let updatedUser = {
                users_id: user.users_id,
                firstname: $("#edit-firstname").val(),
                lastname: $("#edit-lastname").val(),
                user_name: $("#edit-username").val(),
                email: $("#edit-email").val(),
                newsletter: $("#edit-newsletter").val()
            };

            $.ajax({
                url: "users_admin.php",
                type: "POST",
                dataType: "json",
                data: { opt: "update", user: updatedUser },
                success: (response) => {
                    if (response.success) {
                        alert("Utilisateur mis à jour avec succès !");
                        location.reload();
                    } else {
                        alert("Erreur lors de la mise à jour.");
                    }
                },
                error: (xhr, status, error) => {
                    console.error("Erreur AJAX:", error);
                }
            });
        });
    }

    // Récupération des utilisateurs au chargement de la page
    $.ajax({
        url: "users_admin.php",
        type: "GET",
        dataType: "json",
        data: { opt: "select" },
        success: (response) => {
            if (response.success) {
                createRow(response.users);
            } else {
                alert("Erreur de récupération des utilisateurs.");
            }
        },
        error: (xhr, status, error) => {
            console.error("Erreur AJAX:", error);
        }
    });
});
