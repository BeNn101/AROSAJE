document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('contactForm');

    if (!form) {
        console.error('Le formulaire n\'a pas été trouvé sur la page.');
        return; 
    }

    const userName = document.getElementById('userName');
    const userEmail = document.getElementById('userEmail');
    const userMessage = document.getElementById('userMessage');
    const userFirstName = document.getElementById('userFirstName');
    const submitButton = form.querySelector('button[type="submit"]');
    
    const notyf = new Notyf({
        duration: 3000,
        position: {
            x: 'right',
            y: 'top',
        }
    });

    function checkFormValidity() {
        const isFormValid = userName.value.trim() !== '' && userEmail.value.trim() !== '' && userMessage.value.trim() !== '';
        submitButton.disabled = !isFormValid;
    }

    function capitalizeFirstLetter(string) {
        return string.charAt(0).toUpperCase() + string.slice(1).toLowerCase();
    }

    function capitalizeEachWord(string) {
        return string.replace(/\b\w/g, function (char) {
            return char.toUpperCase();
        });
    }

    userName.addEventListener('input', function() {
        this.value = this.value.toUpperCase();
        checkFormValidity();
    });

    userFirstName.addEventListener('input', function() {
        this.value = capitalizeEachWord(this.value);
        checkFormValidity();
    });

    userMessage.addEventListener('input', function() {
        this.value = capitalizeFirstLetter(this.value);
        checkFormValidity();
    });

    [userName, userEmail, userMessage].forEach(input => {
        input.addEventListener('input', checkFormValidity);
    });

    checkFormValidity();

    form.addEventListener('submit', function (event) {
        event.preventDefault();

        var formData = {
            firstName: userFirstName.value,
            lastName: userName.value,
            email: userEmail.value,
            message: userMessage.value,
        };

        fetch('http://localhost:3000/send-email', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(formData),
        })
        .then(response => response.json())
        .then(data => {
            notyf.success(data.message);
            form.reset(); 
            checkFormValidity(); 
        })
        .catch((error) => {
            notyf.error('Erreur lors de l\'envoi');
            console.error('Erreur lors de l\'envoi:', error);
        });
    });
});

$("#logoutConfirm").click(function() {
    $.ajax({
        url: "../../logout.php",
        type: "GET",
        dataType: "json",
        success: function(res) {
            if (res.success) {
                localStorage.removeItem("user");
                window.location.replace("http://localhost/Projet_Arosaje/AROSAJE/Front/LoginPage/login.html");
                notyf.success("Déconnecté avec succès");
            } else {
                notyf.error("Erreur lors de la déconnexion");
            }
        },
    });
});
