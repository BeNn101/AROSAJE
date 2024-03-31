console.log("TOTO")
$(form).submit((event) => {
    console.log("OKOKO")
    event.preventDefault();
    $.ajax({
        url:"../../Back/Login/login.php",
        type: 'POST',
        dataType: 'json',
        data: {
            email: $("#emailInput").val(),
            mot_de_passe: $("#password").val(),
        },
        success: (res) => {
            if (res.success) {
                window.location.replace("http://localhost/Projet_Arosaje/AROSAJE/Front/Homepage/homepage.html");
                console.log("Conenxion réussi")
                console.log("Donnée récupérer")
            } else {
                console.log(res.error)
                alert("Echec de connexion")
            }
        },        
        error: () => {
            alert("Donnée manquante")
        }
    });
})