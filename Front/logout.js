document.addEventListener('DOMContentLoaded', function() {
    const logoutLink = document.querySelector('a[href="../LoginPage/login.html"]');
    const modal = document.getElementById('logoutModal');
    const logoutConfirm = document.getElementById('logoutConfirm');
    const logoutCancel = document.getElementById('logoutCancel');

    logoutLink.addEventListener('click', function(event) {
        event.preventDefault();
        modal.style.display = "block";
    });

    logoutConfirm.addEventListener('click', function() {
        window.location.href = "../LoginPage/login.html";
    });

    logoutCancel.addEventListener('click', function() {
        modal.style.display = "none";
    });

    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    };
});
