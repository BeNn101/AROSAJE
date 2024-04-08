function capitalizeFirstLetter(input) {
    input.value = input.value.charAt(0).toUpperCase() + input.value.slice(1);
}

function capitalizeAllLetters(input) {
    input.value = input.value.toUpperCase();
}

function togglePasswordVisibility() {
    var passwordInput = document.getElementById("pwd");
    passwordInput.type = (passwordInput.type === "password") ? "text" : "password";
    updateEyeIcon();
}

function updateEyeIcon() {
    var passwordInput = document.getElementById("pwd");
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
    var emailInput = document.getElementById("email");
    var passwordInput = document.getElementById("pwd");
    var confirmPasswordInput = document.getElementById("confirmPassword");
    var phoneNumberInput = document.getElementById("phonenumber");
    var isValid = emailInput.checkValidity() && passwordInput.checkValidity() && confirmPasswordInput.checkValidity() && phoneNumberInput.checkValidity(); 
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

    var emailInput = document.getElementById("email").value;
    var passwordInput = document.getElementById("pwd").value;
    var telephoneInput = document.getElementById("phonenumber").value;
    var confirmPasswordInput = document.getElementById("confirmPassword").value;
    var firstName = document.getElementById("firstname").value;
    var lastName = document.getElementById("lastname").value;

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

    // Envoi de l'e-mail
    // var formData = {
    //     email: emailInput,
    //     firstName: firstName,
    //     lastName: lastName
    // };

    // fetch('http://localhost:3001/send-email', {
    //     method: 'POST',
    //     headers: {
    //         'Content-Type': 'application/json',
    //     },
    //     body: JSON.stringify(formData),
    // })
    // .then(response => response.json())
    // .then(data => {
    //     alert('Message envoyé : ' + data.message);
    //     window.location.href = '../LoginPage/login.html';
    // })
    // .catch((error) => {
    //     console.error('Erreur lors de l\'envoi:', error);
    // });
});

var telephoneInput = document.getElementById("phonenumber");

telephoneInput.addEventListener('input', function(event) {
    var inputValue = telephoneInput.value;

    var numericValue = inputValue.replace(/\D/g, '');

    telephoneInput.value = numericValue;
});
