$(document).ready(function(){
    $.ajax({
        url:"../../Back/Account/account.php",
        type:"GET",
        dataType:"json",
        success: function(res) {
            $("#account_name").text(res.user.prenom + " " + res.user.nom)
            $("#account_email").text("Email : " + res.user.email)
            $("#account_num_tel").text("Numéro de Téléphone : 0" + res.user.telephone)
            $("#img_user").attr("src", "../../Back/Register/"+res.user.avatar);
        }
    }).fail(function(jqXHR, textStatus, errorThrown) {
        console.error("Erreur lors de la requête AJAX : ", textStatus, errorThrown);
    });
})

// $("#addAnnonceSubmit").click(function(){

// })

// $("#logout_button").click(function() {
//     $.ajax({
//         url: "../../logout.php",
//         type: "GET",
//         dataType: "json",
//         success: function(res) {
//             console.log("Ciao")
//             // Vérification si la déconnexion a réussi
//             if (res.success) {
//                 // Suppression de l'élément 'user' du localStorage
//                 localStorage.removeItem("user");
//                 window.location.replace("http://localhost/Projet_Arosaje/AROSAJE/Front/LoginPage/login.html");
//                 console.log("Déconnecté");
//             } else {
//                 console.log("Erreur lors de la déconnexion");
//             }
//         },
//     });
// });

