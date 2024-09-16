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
    fetchWithTimeout("http://172.20.10.7:8000/api/me", {
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
    })
    .catch(error => {
        if (error.message === 'Timeout') {
            // Gérer le timeout
            console.error("Request timed out");
            notyf.error("Le serveur ne répond pas. Veuillez réessayer plus tard.");
        } else {
            // Gérer d'autres types d'erreurs (erreurs réseau, serveur hors ligne, etc.)
            console.error("Request failed:", error);
            notyf.error("Impossible de contacter le serveur.");
        }
    });
}