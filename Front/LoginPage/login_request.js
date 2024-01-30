$("form").submit((event) => {
    event.preventDefault();
    console.log($("#emailInput").val());
    console.log($("#password").val());
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
                console.log(res)
            } else {
                console.log(res.error)
            }
        },        
        error: () => {
            console.log( $("#emailInput").val(),$("#password").val());
        }
    });
})