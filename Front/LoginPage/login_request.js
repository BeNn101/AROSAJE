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