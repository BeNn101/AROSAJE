// Formulaire d'ajout des fleurs
$("#getLocation").on("click", function(){
    // Vérifier si le navigateur prend en charge la géolocalisation
    if ("geolocation" in navigator) {
      navigator.geolocation.getCurrentPosition(successCallback, errorCallback);
    } else {
      alert("La géolocalisation n'est pas supportée par votre navigateur.");
    }
  });

  function successCallback(position) {
    // Récupérer les coordonnées
    let latitude = position.coords.latitude;
    let longitude = position.coords.longitude;
    let coord = (latitude,longitude)
  }
  // Si je choisi juste de récuperer toutes les plantes pour les afficher : 
  // Si je choisi d'ajouter une plante alors :
    $("#form").submit((event) =>{
      event.preventDefault();
      $.ajax({
        url:"../../Back/HomePage/HomePage.php",
        type: 'POST',
        dataType: 'json',
        data: {
          // Il faudra rajouter le choix de l'option par l'utilisateur
            name_plante:$("#nameplante").val(),
            image: $("#image").val(),
        },
        success: (res) => {
            if (res.success) {
                console.log(res)
                console.log("Donnée récupérer")
            } else {
                console.log(res.error)
                alert("Echec de connexion")
            }
        },        
        error: (xhr, status, error) => {
          console.log(error);
            alert("Donnée manquante")
        }
    });
    })
    

  function errorCallback(error) {
    // Gérer les erreurs
    switch(error.code) {
      case error.PERMISSION_DENIED:
        alert("L'utilisateur a refusé la demande de géolocalisation.");
        break;
      case error.POSITION_UNAVAILABLE:
        alert("L'emplacement de l'utilisateur n'est pas disponible.");
        break;
      case error.TIMEOUT:
        alert("La demande de géolocalisation a expiré.");
        break;
      case error.UNKNOWN_ERROR:
        alert("Une erreur inconnue est survenue lors de la géolocalisation.");
        break;
    }
  }