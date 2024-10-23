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

        loadAnnonces(token); // Appelle la fonction pour charger les annonces
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
function loadAnnonces(token) {
    const fetchWithTimeout = (url, options, timeout = 5000) => {
        return Promise.race([
            fetch(url, options),
            new Promise((_, reject) =>
                setTimeout(() => reject(new Error('Timeout')), timeout)
            )
        ]);
    };

    // Afficher le loader et masquer le conteneur des annonces
    document.getElementById('loader').style.display = 'flex';
    document.getElementById('annoncesContainer').style.display = 'none';

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
        console.log(data);
        displayAnnonces(data); // Appelle la fonction pour afficher les annonces
        // Masquer le loader et afficher le conteneur des annonces
        document.getElementById('loader').style.display = 'none';
        document.getElementById('annoncesContainer').style.display = 'block';
    })
    .catch(error => {
        console.error("Erreur lors du chargement des annonces :", error);
        notyf.error("Impossible de charger les annonces.");
        // Masquer le loader même en cas d'erreur
        document.getElementById('loader').style.display = 'none';
    });
}

function displayAnnonces(annonces) {
    const annoncesContainer = document.getElementById("annoncesContainer");
    annoncesContainer.innerHTML = '';
    console.log(annonces);

    annonces.forEach(annonce => {
        const annonceContainer = document.createElement("div");
        annonceContainer.className = "annonce";

        const detailsDiv = document.createElement("div");
        detailsDiv.className = "annonce-details";

        // Construire l'URL de l'image
        const imageUrl = `http://172.16.1.148:8000/${annonce.image}`;

        // Récupérer l'adresse en fonction des coordonnées
        const coords = `${annonce.localisation}`; // Contient latitude et longitude
        const [lat, lng] = coords.split(', ');

        // Afficher un message de chargement
        detailsDiv.innerHTML = `
            <h3>${annonce.name_plante}</h3>
            <div class="annonce-content">
                <img src="${imageUrl}" alt="${annonce.name_plante}" class="annonce-img" />
                <div class="details">
                    <p>Adresse : Chargement...</p>
                </div>
                <button class="contacter-btn">
                    <i class="fas fa-comment-dots"></i> Contacter le propriétaire
                </button>
            </div>
        `;

        annonceContainer.appendChild(detailsDiv);
        annoncesContainer.appendChild(annonceContainer);

        detailsDiv.querySelector('.contacter-btn').onclick = function () {
            const recipientId = this.getAttribute('data-recipient-id');
            const plantName = this.getAttribute('data-plant-name');
            const recipientName = this.getAttribute('data-recipient-name');

            checkOrCreateChat(recipientId, plantName, recipientName); // Vérifier ou créer le tchat
        };

        // Récupérer le token pour la redirection
        const token = new URLSearchParams(window.location.search).get('token');

        // Ajouter l'événement de redirection au bouton
        detailsDiv.querySelector('.contacter-btn').onclick = function () {
            if (token) {
                window.location.href = `../TchatPage/tchat.html?token=${token}`; // Inclure le token dans l'URL
            } else {
                console.error('Token is missing or invalid');
            }
        };

        // Appel à l'API pour récupérer l'adresse
        geocodeAddress(`${lat}, ${lng}`).then(({ formattedAddress }) => {
            detailsDiv.querySelector('.details p').textContent = `Adresse : ${formattedAddress}`;
        }).catch(error => {
            console.error('Erreur lors de la récupération de l\'adresse:', error);
            detailsDiv.querySelector('.details p').textContent = 'Adresse : Non trouvée';
        });
    });
}





function geocodeAddress(address) {
    const url = `https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(address)}`;
    return fetch(url)
        .then(response => {
            if (!response.ok) {
                throw new Error('Erreur lors du géocodage');
            }
            return response.json();
        })
        .then(data => {
            if (data.length > 0) {
                return {
                    lat: data[0].lat,
                    lng: data[0].lon,
                    formattedAddress: data[0].display_name
                };
            } else {
                throw new Error('Aucune adresse trouvée');
            }
        });
}
document.getElementById('search-input').addEventListener('input', function() {
    const searchValue = this.value.toLowerCase();
    const annonceElements = document.querySelectorAll('.annonce');

    annonceElements.forEach(annonce => {
        const plantName = annonce.querySelector('h3').textContent.toLowerCase();
        if (plantName.includes(searchValue)) {
            annonce.style.display = 'block'; // Afficher si correspond
        } else {
            annonce.style.display = 'none'; // Masquer si ne correspond pas
        }
    });
});
