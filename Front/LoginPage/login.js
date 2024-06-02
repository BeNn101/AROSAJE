const notyf = new Notyf({
    position: {
        x: 'right',
        y: 'top',
    }
});
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
    var isValid = emailInput.value.trim() !== "" && passwordInput.value.trim() !== "";

    // Afficher ou masquer le bouton de soumission en fonction de la validité du formulaire
    var submitButton = document.querySelector('button[type="submit"]');
    submitButton.disabled = !isValid;
}

document.querySelectorAll('input').forEach(input => {
    input.addEventListener('input', validateForm);
});

document.addEventListener('DOMContentLoaded', validateForm);

// Empêcher la soumission du formulaire par défaut
document.getElementById('form').addEventListener('submit', function(event) {
    event.preventDefault();
    var emailInput = document.getElementById("emailInput").value;
    var mdpInput = document.getElementById("mot_de_passe").value;
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    var mdpRegex = /^[A-Z](?=.*\d)(?=.*[@#$%^+=!])(?=.*[a-zA-Z])[a-zA-Z0-9@#$%^+=!]{7,}$/;
    
    if (!emailRegex.test(emailInput)) {
        notyf.error("Veuillez entrer une adresse email valide.");
        return;
    } 

    $.ajax({
        type: "POST",
        url: "login_request.js", 
        data: { email: emailInput, mot_de_passe: mdpInput },
        dataType: "json",
        success: function(response) {
            if (response.success) {
                
                window.location.href = '../Homepage/homepage.html';
            } else {
                notyf.error("Erreur: " + response.error);
            }
        },
        error: function(xhr, status, error) {
            console.error(xhr.responseText);
        }
    });
});

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
            console.log(res)
            if (res.success) {
                localStorage.setItem("user",JSON.stringify(res.user));
                // window.location.replace("http://localhost/Projet_Arosaje/AROSAJE/Front/Homepage/homepage.html");
                window.location.replace("http://localhost/AROSAJE/Front/Homepage/homepage.html");
            }else{
                notyf.error(res.error);
            }
        }
    })
})
