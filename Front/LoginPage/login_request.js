$("form").submit((event) => {
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