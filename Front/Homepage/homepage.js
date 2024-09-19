var map;

function initialize() {
    getLocation();
    getParams();
}


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
        }
    });
}

function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition, showError);
    } else {
        alert("La géolocalisation n'est pas supportée par votre navigateur.");
    }
}

function showPosition(position) {
    var latitude = position.coords.latitude;
    var longitude = position.coords.longitude;
    map = L.map('map').setView([latitude, longitude], 13);
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '© OpenStreetMap contributors'
    }).addTo(map);

    var marker = L.marker([latitude, longitude]).addTo(map);
    marker.bindPopup("<b>Votre position</b>").openPopup();
    L.Control.geocoder().addTo(map);

    // Masquer le loader et afficher la carte
    document.getElementById('loader').style.display = 'none';
    document.getElementById('map').style.display = 'block';

    loadAnnonces(); // Charge les annonces après avoir initialisé la carte
}



function centerToUserLocation(map) {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
            var latitude = position.coords.latitude;
            var longitude = position.coords.longitude;
            map.setView([latitude, longitude], 13);
        }, function(error) {
            alert("Erreur lors de la récupération de la position actuelle.");
        });
    } else {
        alert("La géolocalisation n'est pas supportée par votre navigateur.");
    }
}

function showError(error) {
    switch(error.code) {
        case error.PERMISSION_DENIED:
            alert("L'utilisateur a refusé la demande de géolocalisation.");
            break;
        case error.POSITION_UNAVAILABLE:
            alert("Les informations de géolocalisation ne sont pas disponibles.");
            break;
        case error.TIMEOUT:
            alert("La demande de géolocalisation a expiré.");
            break;
        case error.UNKNOWN_ERROR:
            alert("Une erreur inconnue s'est produite lors de la récupération de la géolocalisation.");
            break;
    }
}

function loadAnnonces() {
    const token = new URLSearchParams(window.location.search).get('token');

    fetchWithTimeout("http://172.16.1.148:8000/api/getAllPlantes", {
        method: "GET",
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json'
        }
    })
    .then(response => {
        if (response.status === 200) {
            return response.json();
        } else {
            throw new Error(`Erreur lors de la récupération des annonces, statut : ${response.status}`);
        }
    })
    .then(data => {
        data.forEach(annonce => {
            geocodeAndAddMarker(annonce);
        });
    })
    .catch(error => {
        console.error("Erreur lors du chargement des annonces :", error);
        notyf.error("Impossible de charger les annonces.");
    });
}


function geocodeAndAddMarker(annonce) {
    const coords = `${annonce.localisation}`; // latitude, longitude
    const [lat, lng] = coords.split(', ');

    const marker = L.marker([lat, lng]).addTo(map);
    marker.bindPopup(`<b>${annonce.name_plante}</b>`).on('click', function() {
        showAnnonceDetails(annonce);
    });
}

function showAnnonceDetails(annonce) {
    document.getElementById('modal-plant-name').textContent = annonce.name_plante;
    const modalImage = document.getElementById('modal-image');

    if (annonce.image) {
        modalImage.src = `http://172.16.1.148:8000/${annonce.image}`;
        modalImage.style.display = 'block';
    } else {
        modalImage.style.display = 'none';
    }

    const coords = annonce.localisation;
    const [lat, lng] = coords.split(',');

    geocodeAddress(`${lat}, ${lng}`)
        .then(({ formattedAddress }) => {
            document.getElementById('modal-coordinates').textContent = `Adresse : ${formattedAddress}`;
        })
        .catch(error => {
            console.error('Erreur lors de la récupération de l\'adresse:', error);
            document.getElementById('modal-coordinates').textContent = 'Adresse : Non trouvée';
        });

    // Écouteur pour le bouton Contacter
    document.getElementById('contact-button').onclick = function() {
        redirectWithToken('../TchatPage/tchat.html'); // Redirection vers la page de tchat avec le token
    };

    document.getElementById('annonce-modal').style.display = 'block'; // Afficher la modale
}





// Ajouter un écouteur d'événement pour fermer la modale
document.getElementById('close-modal').addEventListener('click', function() {
    document.getElementById('annonce-modal').style.display = 'none';
});


document.getElementById('close-details').addEventListener('click', function() {
    document.getElementById('annonce-details').style.display = 'none';
});






function redirectWithToken(page) {
    let token = new URLSearchParams(window.location.search).get('token');
    console.log(token);

    if (!token) {
        // Si le token n'est pas dans l'URL, le récupérer depuis localStorage
        token = localStorage.getItem('token');
    }

    if (token) {
        console.log(token);
        window.location.href = `${page}?token=${token}`;
        
    } else {
        console.error('Token is missing or invalid');
    }
}


$("#logoutConfirm").click(function() {
    $.ajax({
        url: "../../logout.php",
        type: "GET",
        dataType: "json",
        success: function(res) {
            if (res.success) {
                localStorage.removeItem("user");
                window.location.replace("http://localhost/AROSAJE/Front/LoginPage/login.html");
            }
        },
    });
});

getLocation();
