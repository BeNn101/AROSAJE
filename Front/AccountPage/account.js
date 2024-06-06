const notyf = new Notyf({
    position: {
        x: 'right',
        y: 'top',
    }
});

const ownerPostalCodeInput = document.getElementById('ownerPostalCode');
const ownerCity = document.getElementById('ownerCity');
const plantName = document.getElementById('plantName');
const ownerAddress = document.getElementById('ownerAddress');

function capitalizeFirstLetter(input) {
    return input.toLowerCase().split(/\s+/).map(word => {
        let parts = word.split(/(-|')/);
        parts = parts.map(part => {
            if (/^[a-zA-Z]+$/.test(part)) {
                return part.charAt(0).toUpperCase() + part.slice(1);
            } else {
                return part;
            }
        });
        return parts.join('');
    }).join(' ');
}

ownerPostalCodeInput.addEventListener('input', function(event) {
    this.value = this.value.toUpperCase();
});

ownerCity.addEventListener('input', function(event) {
    this.value = this.value.toUpperCase();
});

ownerAddress.addEventListener('input', function(event) {
    this.value = capitalizeFirstLetter(this.value);
});

plantName.addEventListener('input', function(event) {
    this.value = capitalizeFirstLetter(this.value);
});

function openTab(evt, tabName) {
    var i, tabcontent, tabbuttons;
    tabcontent = document.getElementsByClassName("tab-content");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    tabbuttons = document.getElementsByClassName("tab-button");
    for (i = 0; i < tabbuttons.length; i++) {
        tabbuttons[i].className = tabbuttons[i].className.replace(" active", "");
    }

    document.getElementById(tabName).style.display = "block";
    evt.currentTarget.className += " active";
}

function loadCountries() {
    const countries = [
        "France", "Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Antigua and Barbuda", "Argentina", "Armenia", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bhutan", "Bolivia", "Bosnia and Herzegovina", "Botswana", "Brazil", "Brunei", "Bulgaria", "Burkina Faso", "Burundi", "Cabo Verde", "Cambodia", "Cameroon", "Canada", "Central African Republic", "Chad", "Chile", "China", "Colombia", "Comoros", "Congo", "Costa Rica", "Croatia", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Eswatini", "Ethiopia", "Fiji", "Finland", "France", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Greece", "Grenada", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Honduras", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Mauritania", "Mauritius", "Mexico", "Micronesia", "Moldova", "Monaco", "Mongolia", "Montenegro", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "New Zealand", "Nicaragua", "Niger", "Nigeria", "North Korea", "North Macedonia", "Norway", "Oman", "Pakistan", "Palau", "Palestine", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Poland", "Portugal", "Qatar", "Romania", "Russia", "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Korea", "South Sudan", "Spain", "Sri Lanka", "Sudan", "Suriname", "Sweden", "Switzerland", "Syria", "Taiwan", "Tajikistan", "Tanzania", "Thailand", "Timor-Leste", "Togo", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States", "Uruguay", "Uzbekistan", "Vanuatu", "Vatican City", "Venezuela", "Vietnam", "Yemen", "Zambia", "Zimbabwe"
    ];

    const ownerCountrySelect = document.getElementById('ownerCountry');

    countries.forEach(function(country) {
        const option = document.createElement('option');
        option.value = country;
        option.textContent = country;
        ownerCountrySelect.appendChild(option);
    });

    ownerCountrySelect.value = "France";
}

loadCountries();

document.addEventListener("DOMContentLoaded", function() {
    const addAnnonceBtn = document.querySelector('.add-plant');
    const addAnnonceModal = document.getElementById('addAnnonceModal');
    const closeAddAnnonceModal = document.querySelector('#addAnnonceModal .close');
    const decoBtn = document.querySelector('.deco-btn');
    const addAnnonceForm = document.getElementById('addAnnonceForm');
    const submitButton = addAnnonceForm.querySelector('button[type="submit"]');

    document.querySelector(".tab-button[onclick*='Compte']").click();

    function validateForm() {
        let isValid = true;
        Array.from(addAnnonceForm.elements).forEach(function(element) {
            if (!element.checkValidity()) {
                isValid = false;
            }
        });
        submitButton.disabled = !isValid;
    }

    Array.from(addAnnonceForm.elements).forEach(function(element) {
        element.addEventListener('input', validateForm);
    });

    addAnnonceBtn.addEventListener('click', function() {
        addAnnonceModal.style.display = 'block';
        validateForm();
    });

    closeAddAnnonceModal.addEventListener('click', function() {
        addAnnonceModal.style.display = 'none';
        addAnnonceForm.reset();
        validateForm();
    });

    decoBtn.addEventListener('click', function() {
        window.location.href = '../LoginPage/login.html';
    });

    window.onclick = function(event) {
        if (event.target == addAnnonceModal) {
            addAnnonceModal.style.display = 'none';
            addAnnonceForm.reset();
            validateForm();
        }
    };

    document.getElementById('addAnnonceForm').addEventListener('submit', function(e) {
        e.preventDefault();

        const plantName = document.getElementById('plantName').value;
        const ownerAddress = document.getElementById('ownerAddress').value;
        const ownerPostalCode = document.getElementById('ownerPostalCode').value;
        const ownerCity = document.getElementById('ownerCity').value;
        const ownerCountry = document.getElementById('ownerCountry').value;
        const plantImageFile = document.getElementById('plantImage').files[0];

        const reader = new FileReader();
        reader.onload = function(event) {
            const imageSrc = event.target.result;

            const annonce = {
                plantName,
                ownerAddress,
                ownerPostalCode,
                ownerCity,
                ownerCountry,
                imageSrc
            };

            saveAnnonceToLocalStorage(annonce);
            displayAnnonce(annonce);
            notyf.success('Annonce ajoutée avec succès!');
            addAnnonceModal.style.display = 'none';
            addAnnonceForm.reset();
            validateForm();

            // Ajoutez le marqueur sur la carte
            window.geocodeAndAddMarker(annonce); // Utilisez `window` pour appeler la fonction dans le contexte global
        };

        if (plantImageFile) {
            reader.readAsDataURL(plantImageFile);
        } else {
            const annonce = {
                plantName,
                ownerAddress,
                ownerPostalCode,
                ownerCity,
                ownerCountry,
                imageSrc: null
            };

            saveAnnonceToLocalStorage(annonce);
            displayAnnonce(annonce);
            notyf.success('Annonce ajoutée avec succès!');
            addAnnonceModal.style.display = 'none';
            addAnnonceForm.reset();
            validateForm();

            // Ajoutez le marqueur sur la carte
            window.geocodeAndAddMarker(annonce); // Utilisez `window` pour appeler la fonction dans le contexte global
        }
    });

    function saveAnnonceToLocalStorage(annonce) {
        let annonces = JSON.parse(localStorage.getItem('annonces')) || [];
        annonces.push(annonce);
        try {
            localStorage.setItem('annonces', JSON.stringify(annonces));
        } catch (e) {
            if (e.name === 'QuotaExceededError') {
                notyf.error("Le quota de stockage local a été dépassé. Veuillez supprimer certaines annonces.");
            }
        }
        toggleNoAnnoncesMessage();
    }

    function loadAnnonces() {
        const annonces = JSON.parse(localStorage.getItem('annonces')) || [];
        annonces.forEach(annonce => displayAnnonce(annonce));
        toggleNoAnnoncesMessage();
    }

    function displayAnnonce(annonce) {
        const annoncesContainer = document.getElementById('annoncesContainer');
        const annonceContainer = document.createElement('div');
        annonceContainer.className = 'annonce';

        const imgContainer = document.createElement('div');
        imgContainer.className = 'img-container';
        if (annonce.imageSrc) {
            const img = document.createElement('img');
            img.src = annonce.imageSrc;
            img.alt = 'Image de la plante';
            img.className = 'annonce-img';
            imgContainer.appendChild(img);
        }
        annonceContainer.appendChild(imgContainer);

        const detailsDiv = document.createElement('div');
        detailsDiv.className = 'annonce-details';
        detailsDiv.innerHTML = `<p>${annonce.plantName}</p><p>${annonce.ownerAddress}</p><p>${annonce.ownerPostalCode}</p><p>${annonce.ownerCity}</p><p>${annonce.ownerCountry}</p>`;
        annonceContainer.appendChild(detailsDiv);

        const deleteButton = document.createElement('button');
        deleteButton.textContent = 'Supprimer';
        deleteButton.className = 'delete-btn';
        deleteButton.addEventListener('click', function() {
            removeAnnonceFromLocalStorage(annonce);
            annonceContainer.remove();
            notyf.success('Annonce supprimée avec succès!');
            toggleNoAnnoncesMessage();
        });
        annonceContainer.appendChild(deleteButton);

        annoncesContainer.appendChild(annonceContainer);
    }

    function removeAnnonceFromLocalStorage(annonceToRemove) {
        let annonces = JSON.parse(localStorage.getItem('annonces')) || [];
        annonces = annonces.filter(annonce => annonce.plantName !== annonceToRemove.plantName || annonce.ownerAddress !== annonceToRemove.ownerAddress || annonce.ownerPostalCode !== annonceToRemove.ownerPostalCode || annonce.ownerCity !== annonceToRemove.ownerCity || annonce.ownerCountry !== annonceToRemove.ownerCountry);
        localStorage.setItem('annonces', JSON.stringify(annonces));
        toggleNoAnnoncesMessage();
    }

    function toggleNoAnnoncesMessage() {
        const annonces = JSON.parse(localStorage.getItem('annonces')) || [];
        if (annonces.length === 0) {
            document.getElementById('no-annonces-message').style.display = 'block';
        } else {
            document.getElementById('no-annonces-message').style.display = 'none';
        }
    }

    loadAnnonces();
    toggleNoAnnoncesMessage(); 
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
                console.log("Déconnecté");
            } else {
                console.log("Erreur lors de la déconnexion");
            }
        },
    });
});
