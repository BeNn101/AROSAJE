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
function redirectToAnotherPage() {
    window.location.href = 'login.html';
}

function validateAndSubmit() {
    var emailInput = document.getElementById("emailInput").value;
    var passwordInput = document.getElementById("password").value;

    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(emailInput)) {
        alert("Veuillez entrer une adresse email valide.");
        return; 
    }

    if (passwordInput.length < 8) {
        alert("Le mot de passe doit contenir au moins 8 caractères.");
        return; 
    }

    redirectToAnotherPage();
}