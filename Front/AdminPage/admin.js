const notyf = new Notyf({
    duration: 10000,
    position: {
        x: 'right',
        y: 'top',
    }
});

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
        console.log("User data:", data);
        document.getElementById("loader").style.display = 'none'; // Masquer le loader
        displayUsers(data); // Appeler la fonction pour afficher les utilisateurs
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
    getUsers(token);
}

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

function getUsers(token) {
    fetch("http://172.16.1.148:8000/api/users/alluser", {
        method: "GET",
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json'
        }
    })
    .then(response => {
        console.log("HTTP Status:", response.status); // Ajout de logs pour vérifier la réponse
        if (response.status === 200) {
            return response.json(); // Si réponse correcte, conversion en JSON
        } else {
            throw new Error(`Erreur lors de la récupération des utilisateurs, statut : ${response.status}`);
        }
    })
    .then(data => {
        console.log("User data:", data); // Log des données récupérées
        displayUsers(data); // Appelle la fonction pour afficher les utilisateurs
    })
    .catch(error => {
        console.error("Erreur lors du chargement des utilisateurs :", error);
        notyf.error("Impossible de charger les utilisateurs.");
    });
}

// Fonction pour afficher les utilisateurs dans le conteneur
// Fonction pour afficher les utilisateurs dans le conteneur
function displayUsers(users) {
    const userContainer = document.getElementById("userContainer");
    userContainer.innerHTML = ''; // Vider le conteneur avant d'ajouter les utilisateurs

    if (users.length === 0) {
        userContainer.innerHTML = "<p>Aucun utilisateur trouvé.</p>";
        return;
    }

    users.forEach(user => {
        const userDiv = document.createElement("div");
        userDiv.className = "user";
        userDiv.innerHTML = `
            <p class="user-name">${user.prenom} ${user.nom}</p>
            <p class="user-name">${user.email} </p>
            <button class="delete-btn" onclick="confirmDelete(${user.id_user})">Supprimer</button>
        `;
        userContainer.appendChild(userDiv);
    });
}


function deleteUser(userId) {
    const token = new URLSearchParams(window.location.search).get('token');
    fetch(`http://172.16.1.148:8000/api/usersDelete/${userId}`, {
        method: "DELETE",
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json'
        }
    })
    .then(response => {
        if (response.status === 200) {
            // Afficher la notification de succès
            notyf.success({
                message: "Utilisateur supprimé avec succès.",
                duration: 2000,
                dismissible: true
            });
            
            // Fermer la modale
            document.getElementById("deleteModal").style.display = "none";
            
            // Rafraîchir la page après un court délai
            setTimeout(() => {
                window.location.reload();
            }, 2000); // Attendre 2 secondes avant de rafraîchir
        } else {
            throw new Error(`Erreur lors de la suppression de l'utilisateur, statut : ${response.status}`);
        }
    })
    .catch(error => {
        console.error("Erreur lors de la suppression de l'utilisateur :", error);
        notyf.error({
            message: "Impossible de supprimer l'utilisateur.",
            duration: 3000,
            dismissible: true
        });
    });
}

function confirmDelete(userId) {
    const modal = document.getElementById("deleteModal");
    modal.style.display = "block";
    
    // Associer l'action de suppression à l'ID de l'utilisateur
    document.getElementById("confirmDeleteBtn").onclick = function() {
        deleteUser(userId);
    };
    
    // Fermer la modale lorsque l'utilisateur clique sur "Annuler"
    document.getElementById("cancelDeleteBtn").onclick = function() {
        modal.style.display = "none";
    };
}