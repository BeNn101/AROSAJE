// console.log("Test de connxeion")
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
            // console.log(res.avatar)
            if (res.success) {
                console.log("res")
                alert("Bien inscrit !")
            } else console.log("error");
        }
    });
});

// function 
// togglePasswordVisibility() {

// var 
// passwordInput = 
// document.getElementById("password");

// passwordInput.type
// = (passwordInput.type
// === "password")
// ? "text"
// : "password";

// updateEyeIcon();

// }


// function 
// updateEyeIcon() {

// var 
// passwordInput = 
// document.getElementById("password");

// var 
// eyeIcon = 
// document.querySelector(".eye-icon");


// eyeIcon.style.backgroundImage = (passwordInput.type === "password")
// ? "url('../../Images/show_password.png')"
// : "url('../../Images/hide_password.png')";

// }