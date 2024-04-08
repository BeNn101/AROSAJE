var map; 

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
}

function centerToUserLocation(map) {
    console.log("Trying to center to user location...");
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
            var latitude = position.coords.latitude;
            var longitude = position.coords.longitude;
            console.log("Current position:", latitude, longitude);
            map.setView([latitude, longitude], 13);
        }, function(error) {
            console.error("Error while getting current position:", error);
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

$("#logoutConfirm").click(function() {
    $.ajax({
        url: "../../logout.php",
        type: "GET",
        dataType: "json",
        success: function(res) {
            console.log("Ciao")
            // Vérification si la déconnexion a réussi
            if (res.success) {
                // Suppression de l'élément 'user' du localStorage
                localStorage.removeItem("user");
                // window.location.replace("http://localhost/Projet_Arosaje/AROSAJE/Front/LoginPage/login.html");
                window.location.replace("http://localhost/AROSAJE/Front/LoginPage/login.html");
                console.log("Déconnecté");
            } else {
                console.log("Erreur lors de la déconnexion");
            }
        },
    });
});

getLocation();
