$("form").submit((event) => {
    event.preventDefault();
    $.ajax({
        url:"../../Back/Register/register.php",
        type: "POST",
        dataType: "json",
        data: {
            firstname: $("#firstname").val(),
            lastname: $("#lastname").val(),
            email: $("#email").val(),
            pwd: $("#pwd").val(),
            phonenumber: $("#phonenumber").val(),
        },
        success: (res) => {
            console.log(res)
            if (res.success) {
                alert("Bien inscrit !");
                window.location.href = "http://localhost/Projet_Arosaje/AROSAJE/Front/LoginPage/login.html";
            } else {
                console.log("error");
            }
        }
    });
});