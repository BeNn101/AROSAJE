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

    loadAnnonces();
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
    const annonces = JSON.parse(localStorage.getItem('annonces')) || [];
    annonces.forEach(annonce => {
        console.log('Loading annonce:', annonce); 
        geocodeAndAddMarker(annonce);
    });
}

function geocodeAndAddMarker(annonce) {
    const address = `${annonce.ownerAddress}, ${annonce.ownerCity}, ${annonce.ownerPostalCode}, ${annonce.ownerCountry}`;
    console.log('Geocoding address:', address); 
    L.Control.Geocoder.nominatim().geocode(address, function(results) {
        if (results.length > 0) {
            console.log('Geocoding results:', results); 
            const latLng = results[0].center;
            const marker = L.marker(latLng).addTo(map);
            marker.bindPopup(`<b>${annonce.plantName}</b>`).on('click', function() {
                showAnnonceDetails(annonce);
            });
        } else {
            console.error('No results found for geocoding address:', address); 
        }
    });
}

window.geocodeAndAddMarker = geocodeAndAddMarker; 

function showAnnonceDetails(annonce) {
    document.getElementById('details-plant-name').textContent = annonce.plantName;
    document.getElementById('details-address').textContent = annonce.ownerAddress;
    document.getElementById('details-city').textContent = annonce.ownerCity;
    document.getElementById('details-postal-code').textContent = annonce.ownerPostalCode;
    document.getElementById('details-country').textContent = annonce.ownerCountry;
    const detailsImage = document.getElementById('details-image');
    if (annonce.imageSrc) {
        detailsImage.src = annonce.imageSrc;
        detailsImage.style.display = 'block';
    } else {
        detailsImage.style.display = 'none';
    }
    document.getElementById('annonce-details').style.display = 'block';
}

document.getElementById('close-details').addEventListener('click', function() {
    document.getElementById('annonce-details').style.display = 'none';
});

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
