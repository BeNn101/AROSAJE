// Récupère les paramètres de l'URL
const ParamUrl = new URLSearchParams(window.location.search);

// Variable pour déterminer si nous voulons insérer ou mettre à jour un article
let article_id = null;

function insertSneakers(size, brand, states, price, image, stock, color) {
    const fd = new FormData();
    fd.append('opt', "insert");
    fd.append('size', size);
    fd.append('brand', brand);
    fd.append('state', states);
    fd.append('price', price);
    fd.append('image', image);
    fd.append('stocks', stock);
    fd.append('color', color);

    // Vérifie que le champ "opt" est bien envoyé
    console.log("Données envoyées :", [...fd.entries()]);

    $.ajax({
        url: "../sneakers.php",
        type: "POST",
        dataType: "json",
        data: fd,
        contentType: false,
        processData: false,
        cache: false,
        success: (res) => {
            console.log("Réponse serveur :", res);
            if (res.success) {
                alert("Article ajouter avec succès !");
                $('form')[0].reset(); // Réinitialise le formulaire
            } else {
                console.error("Erreur :", res.error);
                alert("Problème lors de l'ajout du produit");
            }
        },
        error: (xhr, status, error) => {
            console.error("Erreur AJAX :", xhr.responseText);
            alert("Erreur lors de l'ajout de la paire de sneakers !");
        }
    });
}


$("form").submit((event) => {
    event.preventDefault(); // Empêche le rechargement automatique de la page lors de la soumission du formulaire

    // Récupération des valeurs du formulaire
    const brand = $("#brand").val().trim();
    const price = parseFloat($("#price").val());
    const states = $("#state").val().trim();
    const size = parseInt($("#size").val());
    const stock = parseInt($("#stock").val());
    const color = $("#color").val().trim();
    const img = $("#image")[0].files[0]; // Vérifie et récupère correctement le fichier image

    // Vérification des données (pour éviter des erreurs côté backend)
    if (!brand || !price || isNaN(price) || !states || !size || isNaN(size) || !stock || isNaN(stock) || !color || !img) {
        alert("Veuillez remplir correctement tous les champs et sélectionner une image.");
        return;
    }

    // Appel à la fonction d'insertion
    insertSneakers(size, brand, states, price, img, stock, color);
});

