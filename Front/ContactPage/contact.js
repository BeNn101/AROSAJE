document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('contactForm');

    if (!form) {
        console.error('Le formulaire n\'a pas été trouvé sur la page.');
        return; 
    }

    const userName = document.getElementById('userName');
    const userEmail = document.getElementById('userEmail');
    const userMessage = document.getElementById('userMessage');
    const userFirstName = document.getElementById('userFirstName');
    const submitButton = form.querySelector('button[type="submit"]');

    function checkFormValidity() {
        const isFormValid = userName.value.trim() !== '' && userEmail.value.trim() !== '' && userMessage.value.trim() !== '';
        submitButton.disabled = !isFormValid;
    }

    function capitalizeFirstLetter(string) {
        return string.charAt(0).toUpperCase() + string.slice(1).toLowerCase();
    }

    function capitalizeEachWord(string) {
        return string.replace(/\b\w/g, function (char) {
            return char.toUpperCase();
        });
    }

    userName.addEventListener('input', function() {
        this.value = this.value.toUpperCase();
        checkFormValidity();
    });

    userFirstName.addEventListener('input', function() {
        this.value = capitalizeEachWord(this.value);
        checkFormValidity();
    });

    userMessage.addEventListener('input', function() {
        this.value = capitalizeFirstLetter(this.value);
        checkFormValidity();
    });

    [userName, userEmail, userMessage].forEach(input => {
        input.addEventListener('input', checkFormValidity);
    });

    checkFormValidity();

    form.addEventListener('submit', function (event) {
        event.preventDefault();

        var formData = {
            firstName: userFirstName.value,
            lastName: userName.value,
            email: userEmail.value,
            message: userMessage.value,
        };

        fetch('http://localhost:3000/send-email', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(formData),
        })
        .then(response => response.json())
        .then(data => {
            alert('Message envoyé : ' + data.message); 
            form.reset(); 
            checkFormValidity(); 
        })
        .catch((error) => {
            console.error('Erreur lors de l\'envoi:', error);
        });
    });
});
