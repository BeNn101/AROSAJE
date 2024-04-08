$("#addAnnonceSubmit").click(function(e){
    e.preventDefault(); // Pour empêcher le formulaire de s'envoyer de manière traditionnelle

    var formData = new FormData();
    formData.append('name', $("#plantName").val());
    formData.append('adresse', $("#ownerAddress").val());
    formData.append('ville', $("#ownerCity").val());
    formData.append('code_postal', $("#ownerPostalCode").val());
    formData.append('pays', $("#ownerCountry").val());
    formData.append('image_plante', $("#plantImage")[0].files[0]);

    $.ajax({
        url: "../../Back/plantes.php",
        type: "POST",
        processData: false, // Indique à jQuery de ne pas traiter les données
        contentType: false, // Indique à jQuery de ne pas définir le contentType
        data: formData,
        success: function(res) {
            res = JSON.parse(res); // Assurez-vous de convertir la réponse en JSON
            if (res.success) {
                console.log("La requête a réussi !");
            } else {
                console.error("Erreur : ", res.error);
            }
            window.location.reload();
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error("Erreur lors de la requête AJAX : ", textStatus, errorThrown);
        }
    });
});

$("#logout_button").click(function() {
    $.ajax({
        url: "../../logout.php",
        type: "GET",
        dataType: "json",
        success: function(res) {
            // Vérification si la déconnexion a réussi
            if (res.success) {
                // Suppression de l'élément 'user' du localStorage
                localStorage.removeItem("user");
                window.location.replace("http://localhost/Projet_Arosaje/AROSAJE/Front/LoginPage/login.html");
                console.log("Déconnecté");
            } else {
                console.log("Erreur lors de la déconnexion");
            }
        },
    });
});

