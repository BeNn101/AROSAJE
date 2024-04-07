// $(form).submit((event) => {
//     event.preventDefault();
//     $.ajax({
//         url: "../../Back/Login/login.php",
//         type: 'POST',
//         dataType: 'json',
//         data: {
//             email: $("#emailInput").val(),
//             mot_de_passe: $("#mot_de_passe").val(),
//         },
//         success: (res) => {
//             // Plus besoin de parser 'res', jQuery s'en occupe
//             console.log(res);
//             if (res.success) {
//                 window.location.replace("http://localhost/Projet_Arosaje/AROSAJE/Front/Homepage/homepage.html");
//                 // Supprimez le 'c' errant ici
//                 console.log("Donnée récupérée");
//             } else {
//                 console.log(res.error);
//                 alert("Échec de connexion");
//             }
//         },
//         error: (jqXHR, textStatus, errorThrown) => {
//             console.log("Erreur AJAX:", textStatus, errorThrown);
//             alert("Erreur lors de la tentative de connexion. Veuillez réessayer.");
//         }
//     });
// });

$("form").submit((event) => {
    event.preventDefault();
    $.ajax({
        url:"../../Back/Login/login.php",
        type: "POST",
        dataType:"json",
        data: {
            email: $("#emailInput").val(),
            mot_de_passe: $("#mot_de_passe").val(),
        },
        success: (res) => {
            if (res.success) {
                console.log(res.user)
                localStorage.setItem("user",JSON.stringify(res.user));
                window.location.replace("http://localhost/Projet_Arosaje/AROSAJE/Front/Homepage/homepage.html");
            }else{
                alert(res.error);

            }
        }
    })
})