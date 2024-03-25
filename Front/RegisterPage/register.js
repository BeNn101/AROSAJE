$("form").submit((event) => {
    console.log('test');
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
            if (res.success) {
                console.log("res")
                alert("Bien inscrit !")
            } else console.log("error");
        }
    });
});

function capitalizeFirstLetter(input) {
    input.value = input.value.charAt(0).toUpperCase() + input.value.slice(1);
}
function capitalizeAllLetters(input) {
    input.value = input.value.toUpperCase();
}
function togglePasswordVisibility() {
    var passwordInput = document.getElementById("password");
    passwordInput.type = (passwordInput.type === "password") ? "text" : "password";
    updateEyeIcon();
}
function updateEyeIcon() {
    var passwordInput = document.getElementById("password");
    var eyeIcon = document.querySelector(".eye-icon");

    eyeIcon.style.backgroundImage = (passwordInput.type === "password") ? "url('../../images/show_password.png')" : "url('../../images/hide_password.png')";
}
function toggleConfirmPasswordVisibility() {
    var passwordInput = document.getElementById("confirmPassword");
    passwordInput.type = (passwordInput.type === "password") ? "text" : "password";
    updateConfirmPasswordEyeIcon();
}


function updateConfirmPasswordEyeIcon() {
    var passwordInput = document.getElementById("confirmPassword");
    var eyeIcon = document.querySelector(".eye-icon-confirm");

    eyeIcon.style.backgroundImage = (passwordInput.type === "password") ? "url('../../images/show_password.png')" : "url('../../images/hide_password.png')";
}

function validateForm() {
    var emailInput = document.getElementById("emailInput");
    var passwordInput = document.getElementById("password");
    var confirmPasswordInput = document.getElementById("confirmPassword");
    var isValid = emailInput.checkValidity() && passwordInput.checkValidity() && confirmPasswordInput.checkValidity();

    var submitButton = document.querySelector('button[type="submit"]');
    submitButton.disabled = !isValid;

    if (isValid) {
        submitButton.classList.remove("disabled");
    } else {
        submitButton.classList.add("disabled");
    }
}

document.querySelectorAll('input').forEach(input => {
    input.addEventListener('input', validateForm);
});

document.addEventListener('DOMContentLoaded', validateForm);



document.querySelector('form').addEventListener('submit', function(event) {
    event.preventDefault();

    var emailInput = document.getElementById("emailInput").value;
    var passwordInput = document.getElementById("password").value;
    var telephoneInput = document.getElementById("telephoneInput").value;
    var confirmPasswordInput = document.getElementById("confirmPassword").value;

    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(emailInput)) {
        alert("Veuillez entrer une adresse email valide.");
        return;
    }
    if (passwordInput.length < 8) {
        alert("Le mot de passe doit contenir au moins 8 caractères.");
        return; 
    }
    if (!passwordInput.match(/[a-z]/) || !passwordInput.match(/[A-Z]/)) {
        alert("Le mot de passe doit contenir au moins une lettre majuscule et une lettre minuscule.");
        return;
    }
    if (!passwordInput.match(/[0-9]/)) {
        alert("Le mot de passe doit contenir au moins un chiffre.");
        return;
    }
    if (!passwordInput.match(/[!@#$%^&*]/)) {
        alert("Le mot de passe doit contenir au moins un caractère spécial parmi : !@#$%^&*.");
        return;
    }
    if (passwordInput !== confirmPasswordInput) {
        alert("Les mots de passe ne correspondent pas.");
        return;
    }
    if (telephoneInput.trim() !== '') {
        var telephoneRegex = /^(0|\+33)[1-9]([-. ]?[0-9]{2}){4}$/;
        if (!telephoneRegex.test(telephoneInput)) {
            alert("Veuillez entrer un numéro de téléphone valide (format français).");
            return;
        }
    }
    window.location.href = '../LoginPage/login.html';
});
var telephoneInput = document.getElementById("telephoneInput");

telephoneInput.addEventListener('input', function(event) {
    var inputValue = telephoneInput.value;

    var numericValue = inputValue.replace(/\D/g, '');

    telephoneInput.value = numericValue;
});