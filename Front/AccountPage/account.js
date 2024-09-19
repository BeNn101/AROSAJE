
const notyf = new Notyf({
  duration: 10000,
  position: {
      x: 'right',
      y: 'top',
  }
});

function redirectWithToken(page) {
  let token = new URLSearchParams(window.location.search).get('token') || localStorage.getItem('token');
  if (token) {
      window.location.href = `${page}?token=${token}`;
  } else {
      console.error('Token is missing or invalid');
  }
}

function getParams() {
  const params = new URLSearchParams(window.location.search);
  const token = params.get('token') || localStorage.getItem('token');

  if (!token) {
      console.error("Token is missing or invalid");
      window.location.replace("http://localhost/AROSAJE/Front/LoginPage/login.html");
      return;
  }

  // Afficher le loader
  document.getElementById('loader').style.display = 'block';

  fetchWithTimeout("http://172.16.1.148:8000/api/me", {
      method: "GET",
      headers: {
          'Authorization': `Bearer ${token}`,
          'Content-Type': 'application/json',
      }
  }, 5000)
  .then(response => {
      if (response.status === 200) {
          return response.json();
      } else {
          throw new Error(`Unauthorized or failed request with status ${response.status}`);
      }
  })
  .then(data => {
    // Masquer le loader et afficher les détails du profil
    document.getElementById('loader').style.display = 'none';
    document.getElementById('your_profil').style.display = 'block'; 

    // Mettre à jour les informations de profil
    $("#your_name").text(`${data.user.prenom} ${data.user.nom}`);
    $("#your_email").text(data.user.email);
    $("#your_phone").text(`0${data.user.telephone}`);

    // Vérifier si l'utilisateur a un type "admin" (user_type == 4)
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

    // Charger les annonces de l'utilisateur
    loadUserAnnonces(data.user.id_user);
})

  .catch(error => {
      console.error(error);
      document.getElementById('loader').style.display = 'none'; // Masquer le loader en cas d'erreur
  });
}


function fetchWithTimeout(url, options, timeout = 5000) {
  return Promise.race([
      fetch(url, options),
      new Promise((_, reject) => setTimeout(() => reject(new Error('Timeout')), timeout))
  ]);
}

function loadUserAnnonces(userId) {
  fetch("http://172.16.1.148:8000/api/getAllPlantes")
  .then(response => response.json())
  .then(data => {
      const annonces = data.filter(annonce => annonce.id_user === userId);
      const noAnnoncesMessage = document.getElementById('no-annonces-message');
      if (annonces.length === 0) {
          noAnnoncesMessage.style.display = 'block';
      } else {
          noAnnoncesMessage.style.display = 'none';
          displayAnnonces(annonces);
      }
  })
  .catch(error => {
      console.error("Erreur lors du chargement des annonces :", error);
      notyf.error("Erreur lors du chargement des annonces.");
  });
}

function displayAnnonces(annonces) {
  const annoncesContainer = document.getElementById("annoncesContainer");
  annoncesContainer.innerHTML = '';

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

      // Appel à l'API pour récupérer l'adresse
      geocodeAddress(`${lat}, ${lng}`).then(({ formattedAddress }) => {
        console.log(formattedAddress);
        detailsDiv.innerHTML = `
        <h3>${annonce.name_plante}</h3>
        <div class="annonce-content">
            <img src="${imageUrl}" alt="${annonce.name_plante}" class="annonce-img" />
            <div class="details">
                <p>Adresse : ${formattedAddress}</p>
            </div>
        </div>
    `;
    

          annonceContainer.appendChild(detailsDiv);
          annoncesContainer.appendChild(annonceContainer);
      }).catch(error => {
          console.error('Erreur lors de la récupération de l\'adresse:', error);
          detailsDiv.innerHTML = `
              <img src="${imageUrl}" alt="${annonce.name_plante}" class="annonce-img" />
              <h3>${annonce.name_plante}</h3>
              <p>Adresse : Non trouvée</p>
          `;
          annonceContainer.appendChild(detailsDiv);
          annoncesContainer.appendChild(annonceContainer);
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





const plantName = document.getElementById("plantName");
const ownerCity = document.getElementById("ownerCity");
const plantImage = document.getElementById("plantImage");
const submitButton = document.getElementById("addAnnonceSubmit");

function checkFormValidity() {
  const isFormValid = plantName.value.trim() !== "" &&
                      plantImage.files.length > 0 &&
                      ownerCity.value.trim() !== "";
  submitButton.disabled = !isFormValid;
}

plantName.addEventListener("input", checkFormValidity);
plantImage.addEventListener("change", checkFormValidity);
ownerCity.addEventListener("input", checkFormValidity);

document.addEventListener("DOMContentLoaded", function () {
  loadCountries(); // Charger les pays lorsque le document est prêt
  const addAnnonceBtn = document.querySelector(".add-plant");
  const addAnnonceModal = document.getElementById("addAnnonceModal");
  const closeAddAnnonceModal = document.querySelector("#addAnnonceModal .close");
  const addAnnonceForm = document.getElementById("addAnnonceForm");
  let currentUserId = null;

  const token = new URLSearchParams(window.location.search).get('token') || localStorage.getItem('token');

  if (token) {
      fetchWithTimeout("http://172.16.1.148:8000/api/me", {
          method: "GET",
          headers: {
              'Authorization': `Bearer ${token}`,
              'Content-Type': 'application/json',
          }
      })
      .then(response => response.json())
      .then(data => {
          currentUserId = data.user.id_user; // Assurez-vous que cela correspond à votre structure
          console.log("Current User ID:", currentUserId);
      })
      .catch(error => {
          console.error("Error fetching user:", error);
      });
  }

  addAnnonceBtn.addEventListener("click", function () {
      addAnnonceModal.style.display = "block";
  });

  closeAddAnnonceModal.addEventListener("click", function () {
      addAnnonceModal.style.display = "none";
      addAnnonceForm.reset();
  });

  window.onclick = function (event) {
      if (event.target === addAnnonceModal) {
          addAnnonceModal.style.display = "none";
          addAnnonceForm.reset();
      }
  };

  addAnnonceForm.addEventListener('submit', async function (event) {
    event.preventDefault();

    const imageFile = plantImage.files[0];
    if (!imageFile) {
        notyf.error('Veuillez sélectionner une image.');
        return;
    }

    if (!currentUserId) {
        notyf.error('ID utilisateur manquant.');
        return;
    }

    const address = `${ownerAddress.value}, ${ownerCity.value}`; // Utilisez tous les champs nécessaires pour l'adresse

    try {
        const { lat, lng, formattedAddress } = await geocodeAddress(address);

        const reader = new FileReader();
        reader.readAsDataURL(imageFile);
        reader.onloadend = function () {
            const base64data = reader.result;

            const formData = new FormData();
            formData.append('name_plante', plantName.value);
            formData.append('image', base64data.split(',')[1]);
            formData.append('localisation', `${lat}, ${lng}`); // Enregistrer les coordonnées
            formData.append('address', formattedAddress); // Enregistrer l'adresse formatée
            formData.append('id_user', currentUserId);

            fetch('http://172.16.1.148:8000/api/plantes', {
                method: 'POST',
                body: formData
            })
            .then(response => {
                console.log(response);
                console.log(response.ok);
                console.log(response.status);

                // Vérifier le statut de la réponse
                if (response.ok) {
                    return response.json(); // Retourner les données JSON
                } else {
                    throw new Error('Erreur lors de la création de l\'annonce');
                }
            })
            .then(data => {
                notyf.success('Annonce ajoutée avec succès');
                addAnnonceModal.style.display = 'none';
                loadUserAnnonces(currentUserId);
            })
            .catch(error => {
                console.error('Erreur:', error);
                notyf.error(`Erreur: ${error.message}`);
            });
        };

        reader.onerror = function () {
            notyf.error('Erreur lors de la lecture de l\'image.');
        };

    } catch (error) {
        notyf.error(error.message);
    }
});






});
function loadCountries() {
  const countries = [
      "France", 
      "USA", 
      "Canada", 
      "Germany", 
      "Spain", 
      "Italy", 
      "UK", 
      "Belgium", 
      "Netherlands", 
      "Switzerland"
  ];
  const ownerCountrySelect = document.getElementById("ownerCountry");

  countries.forEach(country => {
      const option = document.createElement("option");
      option.value = country;
      option.textContent = country;
      ownerCountrySelect.appendChild(option);
  });

  ownerCountrySelect.value = "France"; // Définir la France comme sélection par défaut
}

// Ajoute cette fonction au début du fichier JavaScript pour s'assurer qu'elle est disponible
function openTab(evt, tabName) {
  var i, tabcontent, tabbuttons;
  
  // Cache tout le contenu des onglets
  tabcontent = document.getElementsByClassName("tab-content");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none"; // Cache chaque élément avec la classe "tab-content"
  }

  // Supprime la classe "active" de tous les boutons
  tabbuttons = document.getElementsByClassName("tab-button");
  for (i = 0; i < tabbuttons.length; i++) {
    tabbuttons[i].className = tabbuttons[i].className.replace(" active", "");
  }

  // Affiche le contenu de l'onglet sélectionné
  document.getElementById(tabName).style.display = "block";

  // Ajoute la classe "active" au bouton cliqué
  evt.currentTarget.className += " active";
}

