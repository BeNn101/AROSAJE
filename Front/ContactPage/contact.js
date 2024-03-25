document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('contactForm');
    const userName = document.getElementById('userName');
    const userEmail = document.getElementById('userEmail');
    const userMessage = document.getElementById('userMessage');
    const submitButton = form.querySelector('button[type="submit"]');

    function checkFormValidity() {
        const isFormValid = userName.value.trim() !== '' && userEmail.value.trim() !== '' && userMessage.value.trim() !== '';
        submitButton.disabled = !isFormValid;
    }

    [userName, userEmail, userMessage].forEach(input => {
        input.addEventListener('input', checkFormValidity);
    });

    checkFormValidity();

    form.addEventListener('submit', function (event) {
        event.preventDefault();
        alert(`Merci ${userName.value}, votre message a été envoyé !`);
        form.reset();
        checkFormValidity();
    });
});
