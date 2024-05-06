var homepageButton = document.querySelector('button[type="submit"]');

function togglePasswordVisibility() {
    let passwordInput = document.getElementById("mot_de_passe");
    passwordInput.type = (passwordInput.type === "password") ? "text" : "password";
    updateEyeIcon();
}

function updateEyeIcon() {
    let passwordInput = document.getElementById("mot_de_passe");
    let eyeIcon = document.querySelector(".eye-icon");

    eyeIcon.style.backgroundImage = (passwordInput.type === "password") ? "url('../../images/show_password.png')" : "url('../../images/hide_password.png')";
}

function validateForm() {
    var emailInput = document.getElementById("emailInput");
    var passwordInput = document.getElementById("mot_de_passe");
    var submitButton = document.querySelector('button[type="submit"]');
    var isValid = emailInput.value.trim() !== "" && passwordInput.value.trim() !== "";

    submitButton.disabled = !isValid;
}

document.querySelectorAll('input').forEach(input => {
    input.addEventListener('input', validateForm);
});

document.addEventListener('DOMContentLoaded', validateForm);
homepageButton.addEventListener('click', function(event) {
    event.preventDefault(); 
    var emailInput = document.getElementById("emailInput").value;
    var mdpInput = document.getElementById("mot_de_passe").value;
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    var mdpRegex = '/^[A-Z](?=.*\d)(?=.*[@#$%^+=!])(?=.*[a-zA-Z])[a-zA-Z0-9@#$%^+=!]{7,}$/';
    if (!emailRegex.test(emailInput)) {
        alert("Veuillez entrer une adresse email valide.");
        return;
    } 
        window.location.href = '../Homepage/homepage.html';
});