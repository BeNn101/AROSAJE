$("#logout_button").click(function() {
    $.ajax({
        url: "../../logout.php",
        type: "GET",
        dataType: "json",
        success: function(res) {
            console.log("Ciao")
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