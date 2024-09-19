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
});

$("form").submit((event) => {
    event.preventDefault();
    
    $.ajax({
        url: "http://172.16.1.148:8000/api/login",
        type: "POST",
        dataType: "json",
        timeout: 5000, // Délai d'attente de 5 secondes avant de considérer que l'API ne répond pas
        data: {
            email: $("#emailInput").val(),
            mot_de_passe: $("#mot_de_passe").val(),
        },
        success: (res, textStatus, jqXHR) => {
            // Récupérer le statut HTTP
            console.log("HTTP Status:", jqXHR.status);

            if (jqXHR.status == 200) {
                localStorage.setItem("user", JSON.stringify(res.user));
                // Afficher la notification de succès avant la redirection
                notyf.success('Vous êtes connecté !');
                
                // Utiliser setTimeout pour attendre la fin de la notification avant la redirection
                setTimeout(() => {
                    window.location.replace(`http://localhost/AROSAJE/Front/Homepage/homepage.html?token=${encodeURIComponent(res['token'])}`);
                }, 1000); // 1 seconde d'attente pour laisser le temps de voir la notification
            } else {
                console.log("API status message:", res.status || "Aucune information de statut");
                notyf.error(res.status || "Une erreur s'est produite");
            }
        },
        error: (jqXHR, textStatus, errorThrown) => {
            console.log("HTTP Status Error:", jqXHR.status);

            if (textStatus === "timeout") {
                // Gestion du timeout
                notyf.error("Le serveur ne répond pas. Veuillez réessayer plus tard.");
            } else if (jqXHR.status === 0) {
                console.log(jqXHR.status);
                // Le serveur est probablement hors ligne
            } else {
                // Autre type d'erreur (réseau, serveur, etc.)
                notyf.error(`Erreur : ${jqXHR.status} - ${errorThrown}`);
            }
        }
    });
});
