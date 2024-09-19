function getParams() {
    const params = new URLSearchParams(window.location.search);
    const token = params.get('token');

    console.log("Token:", token);

    if (!token) {
        console.error("Token is missing or invalid");
        return;
    }

    // Définir un délai d'attente (timeout)
    const fetchWithTimeout = (url, options, timeout = 5000) => {
        return Promise.race([
            fetch(url, options),
            new Promise((_, reject) =>
                setTimeout(() => reject(new Error('Timeout')), timeout)
            )
        ]);
    };

    // Utilisation de fetch avec timeout
    fetchWithTimeout("http://172.16.1.148:8000/api/me", {
        method: "GET",
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json'
        }
    }, 5000) // Timeout de 5 secondes
    .then(response => {
        console.log("HTTP Status:", response.status);
        if (response.status === 200) {
            return response.json();
        } else {
            window.location.replace("http://localhost/AROSAJE/Front/LoginPage/login.html");
            throw new Error(`Unauthorized or failed request with status ${response.status}`);
        }
    })
    .then(data => {
        console.log("Response data:", data);

        // Vérifier le type d'utilisateur
        if (data.user.user_type === 4) {
            // Ajouter l'onglet Admin avant le bouton de déconnexion
            const navbarLinks = document.querySelector('.navbar-links');
            const logoutLink = document.getElementById('logout');
            
            const adminLink = document.createElement('a');
            adminLink.href = "javascript:void(0);";
            adminLink.innerHTML = '<i class="fas fa-cogs"></i> Admin';
            adminLink.onclick = function() {
                redirectWithToken('../AdminPage/admin.html');
            };
            
            // Insérer avant le bouton de déconnexion
            navbarLinks.insertBefore(adminLink, logoutLink);
        }
    })
    .catch(error => {
        if (error.message === 'Timeout') {
            // Gérer le timeout
            console.error("Request timed out");
            notyf.error("Le serveur ne répond pas. Veuillez réessayer plus tard.");
        } else {
            // Gérer d'autres types d'erreurs (erreurs réseau, serveur hors ligne, etc.)
            console.error("Request failed:", error);
            notyf.error("Impossible de contacter le serveur. Veuillez vérifier que l'API est allumée.");
        }
    });
}

function redirectWithToken(page) {
    let token = new URLSearchParams(window.location.search).get('token');

    if (!token) {
        // Si le token n'est pas dans l'URL, le récupérer depuis localStorage
        token = localStorage.getItem('token');
    }

    if (token) {
        window.location.href = `${page}?token=${token}`;
    } else {
        console.error('Token is missing or invalid');
    }
}


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

        fetch('http://localhost:3001/send-email', {
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
