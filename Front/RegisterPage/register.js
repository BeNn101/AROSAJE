const notyf = new Notyf({
    duration: 10000,
    position: {
        x: 'right',
        y: 'top',
    }
});

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
    var acceptTerms = document.getElementById("acceptTerms");
    var isValid = emailInput.checkValidity() && passwordInput.checkValidity() && confirmPasswordInput.checkValidity() && phoneNumberInput.checkValidity() && acceptTerms.checked; 
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
        notyf.error("Veuillez entrer une adresse email valide.");
        return;
    }
    if (passwordInput.length < 8) {
        notyf.error("Le mot de passe doit contenir au moins 8 caractères.");
        return; 
    }
    if (!passwordInput.match(/[a-z]/) || !passwordInput.match(/[A-Z]/)) {
        notyf.error("Le mot de passe doit contenir au moins une lettre majuscule et une lettre minuscule.");
        return;
    }
    if (!passwordInput.match(/[0-9]/)) {
        notyf.error("Le mot de passe doit contenir au moins un chiffre.");
        return;
    }
    if (!passwordInput.match(/[!@#$%^&*]/)) {
        notyf.error("Le mot de passe doit contenir au moins un caractère spécial parmi : !@#$%^&*.");
        return;
    }
    if (passwordInput !== confirmPasswordInput) {
        notyf.error("Les mots de passe ne correspondent pas.");
        return;
    }
    if (telephoneInput.trim() !== '') {
        var telephoneRegex = /^(0|\+33)[1-9]([-. ]?[0-9]{2}){4}$/;
        if (!telephoneRegex.test(telephoneInput)) {
            notyf.error("Veuillez entrer un numéro de téléphone valide (format français).");
            return;
        }
    }

    var formData = {
        email: emailInput,
        firstName: firstName,
        lastName: lastName
    };
});


var telephoneInput = document.getElementById("phonenumber");

telephoneInput.addEventListener('input', function(event) {
    var inputValue = telephoneInput.value;
    var numericValue = inputValue.replace(/\D/g, '');  // Supprimer tout sauf les chiffres
    telephoneInput.value = numericValue;  // Remettre la valeur formatée
});


$("form").submit((event) => {
    event.preventDefault();

    // Récupérer les valeurs des champs de formulaire
    const email = $("#email").val();
    const mot_de_passe = $("#pwd").val();
    const confirmPassword = $("#confirmPassword").val();
    const telephone = $("#phonenumber").val();
    const nom = $("#lastname").val();
    const prenom = $("#firstname").val();

    // Validation des champs (email, mot de passe, etc.)
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
        notyf.error("Veuillez entrer une adresse email valide.");
        return;
    }
    if (mot_de_passe.length < 8) {
        notyf.error("Le mot de passe doit contenir au moins 8 caractères.");
        return; 
    }
    if (mot_de_passe !== confirmPassword) {
        notyf.error("Les mots de passe ne correspondent pas.");
        return;
    }

    // Vérification du numéro de téléphone (si fourni)
    var telephoneRegex = /^(0|\+33)[1-9]([-. ]?[0-9]{2}){4}$/;
    if (telephone.trim() !== '' && !telephoneRegex.test(telephone)) {
        notyf.error("Veuillez entrer un numéro de téléphone valide (format français).");
        return;
    }

    // Préparer les données à envoyer à l'API
    const data = {
        mot_de_passe: mot_de_passe,
        email: email,
        telephone: telephone,
        nom: nom,
        prenom: prenom
    };

    // Appel AJAX à l'API d'inscription
    $.ajax({
        url: "http://172.16.1.148:8000/api/users/createUser",  // URL de l'API d'inscription
        type: "POST",
        dataType: "json",  // Type de données attendues en retour
        contentType: "application/json; charset=UTF-8",  // Type de contenu envoyé
        timeout: 5000,  // Timeout de 5 secondes pour la requête
        data: JSON.stringify(data),  // Les données sont envoyées en format JSON
        success: (res, textStatus, jqXHR) => {
            console.log("HTTP Status:", jqXHR.status);

            if (jqXHR.status == 201) {  // Code 201 : Utilisateur créé
                notyf.success("Utilisateur créé avec succès !");

                // Envoi de l'email de bienvenue
                const emailData = {
                    firstName: prenom,
                    lastName: nom,
                    email: email
                };

                $.ajax({
                    url: "http://localhost:3000/send-email",  // URL de l'API pour l'envoi d'email
                    type: "POST",
                    dataType: "json",  // Type de données attendues en retour
                    contentType: "application/json; charset=UTF-8",  // Type de contenu envoyé
                    timeout: 5000,  // Timeout de 5 secondes pour la requête
                    data: JSON.stringify(emailData),  // Les données sont envoyées en format JSON
                    success: (res, textStatus, jqXHR) => {
                        console.log("Email envoyé avec succès :", res.message);
                        notyf.success(res.message);
                    },
                    error: (jqXHR, textStatus, errorThrown) => {
                        console.error("Erreur lors de l'envoi de l'email :", errorThrown);
                        notyf.error("Erreur lors de l'envoi de l'email de confirmation.");
                    }
                });

                // Attendre que les notifications soient affichées avant de rediriger
                setTimeout(() => {
                    window.location.replace('../LoginPage/login.html');
                }, 2000);  // Attendre 2 secondes avant la redirection
            } else {
                notyf.error(res.status || "Une erreur s'est produite lors de l'inscription.");
            }
        },
        error: (jqXHR, textStatus, errorThrown) => {
            console.log("HTTP Status Error:", jqXHR.status);

            if (jqXHR.status === 409) {
                // Si l'utilisateur existe déjà (statut 409 Conflict)
                notyf.error("Un utilisateur avec cet email existe déjà.");
            } else if (textStatus === "timeout") {
                notyf.error("Le serveur ne répond pas. Veuillez réessayer plus tard.");
            } else if (jqXHR.status === 0) {
            } else {
                notyf.error(`Erreur : ${jqXHR.status} - ${errorThrown}`);
            }
        }
    });
});
