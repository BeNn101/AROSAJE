// currentUser.js

function getCurrentUser(token) {
    return fetch("http://172.20.10.7:8000/api/me", {
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
            throw new Error(`Failed to fetch user info. Status code: ${response.status}`);
        }
    })
    .then(data => {
        // Retourne les informations de l'utilisateur
        return {
            id: data.user.id_user,
            nom: data.user.nom,
            prenom: data.user.prenom,
            email: data.user.email
        };
    })
    .catch(error => {
        console.error("Error fetching user info:", error);
        return null; // Retourne null en cas d'erreur
    });
}
