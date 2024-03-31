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
            avatar: $("#avatar").val(),
        },
        success: (res) => {
            console.log("TEST")
            console.log(res)
            if (res.success) {
                console.log("res");
                alert("Bien inscrit !");
            } else {
                console.log("error");
            }
        }
    });
});
