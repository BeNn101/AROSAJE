document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('contactForm');

    if (!form) {
        console.error('Le formulaire n\'a pas été trouvé sur la page.');
        return; 
    }

    const userName = document.getElementById('lastname');
    const userFirstName = document.getElementById('firstname');
    const email = document.getElementById('email');

    
    form.addEventListener('submit', function (event) {
        event.preventDefault();

        var formData = {
            firstName: userFirstName.value,
            lastName: userName.value,
            email: email.value,
        };

        fetch('http://localhost:3001/send-email', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(formData),
        })
        .then(response => response.json())
        .then(data => {
            alert('Message envoyé : ' + data.message);
            window.location.href = '../LoginPage/login.html';
        })
        .catch((error) => {
            console.error('Erreur lors de l\'envoi:', error);
        });
    });
});
