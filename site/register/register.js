$("form").submit((event) => {
    event.preventDefault();

    $.ajax({
        url:"register.php",
        type: "POST",
        dataType: "json",
        data: {
            firstname: $("#firstname").val(),
            lastname: $("#lastname").val(),
            user_name: $("#username").val(),
            email: $("#email").val(),
            pwd: $("#pwd").val()
        },
        success: (res) => {
            
            if (res.success){
                window.location.replace("../../site/login_logout/login.html");
                alert("Vous êtes bien inscrit, bravo à toi, nouveau reseller !")
            } 
            else{
                console.log("error");
                alert("Désolé, votre inscription a échoué. Veuillez réessayer ultérieurement.");
            }
        }
    });
});