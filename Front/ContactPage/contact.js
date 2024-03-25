const userName = document.getElementById('userName');

userName.addEventListener('input', function(event) {
    this.value = this.value.toUpperCase();
});
document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('contactForm');
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

    userFirstName.addEventListener('input', function(event) {
        this.value = capitalizeEachWord(this.value);
        checkFormValidity();
    });

    userMessage.addEventListener('input', function(event) {
        this.value = capitalizeFirstLetter(this.value);
        checkFormValidity();
    });

    [userName, userEmail, userMessage].forEach(input => {
        input.addEventListener('input', checkFormValidity);
    });

    checkFormValidity();

    form.addEventListener('submit', function (event) {
        event.preventDefault();
        alert(`Merci ${userFirstName.value} ${userName.value}, votre message a été envoyé !`);
        form.reset();
        checkFormValidity();
    });
});
