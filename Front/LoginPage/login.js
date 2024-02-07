function togglePasswordVisibility() {
    //vérifie le type actuel du mdp et le rend visible ou non avec la fonction update
    let passwordInput = document.getElementById("password");
    passwordInput.type = (passwordInput.type === "password") ? "text" : "password";
    updateEyeIcon();
}

function updateEyeIcon() {
    //rend visible ou non le mdp
    let passwordInput = document.getElementById("password");
    let eyeIcon = document.querySelector(".eye-icon");

    eyeIcon.style.backgroundImage = (passwordInput.type === "password") ? "url('../../images/show_password.png')" : "url('../../images/hide_password.png')";
}

