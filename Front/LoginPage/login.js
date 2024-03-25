function togglePasswordVisibility() {
    let passwordInput = document.getElementById("password");
    passwordInput.type = (passwordInput.type === "password") ? "text" : "password";
    updateEyeIcon();
}

function updateEyeIcon() {
    let passwordInput = document.getElementById("password");
    let eyeIcon = document.querySelector(".eye-icon");

    eyeIcon.style.backgroundImage = (passwordInput.type === "password") ? "url('../../images/show_password.png')" : "url('../../images/hide_password.png')";
}

function validateForm() {
    var emailInput = document.getElementById("emailInput");
    var passwordInput = document.getElementById("password");
    var submitButton = document.querySelector('button[type="submit"]');
    var isValid = emailInput.value.trim() !== "" && passwordInput.value.trim() !== "";

    submitButton.disabled = !isValid;
}

document.querySelectorAll('input').forEach(input => {
    input.addEventListener('input', validateForm);
});

document.addEventListener('DOMContentLoaded', validateForm);