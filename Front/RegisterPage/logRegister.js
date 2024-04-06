console.log( $("#firstname").val());
console.log( $("#lastname").val());
console.log($("#email").val()),
console.log($("#pwd").val()),
console.log($("#phonenumber").val())

$("form").submit((event) => {
    event.preventDefault();
    $.ajax({
        url:"../../Back/Register/register.php",
        type: "POST",
        dataType: "json",
        data: {
            firstname: $("#firstname").val(),
            lastname: $("#lastname").val(),
            email: $("#email").val(),
            pwd: $("#pwd").val(),
            phonenumber: $("#phonenumber").val(),
        },
        success: (res) => {
            console.log(res)
            if (res.success) {
                console.log("res");
                alert("Bien inscrit !");
            } else {
                console.log("error");
            }
        }
    });
});


// function CreateUser(firstname,lastname,email,pwd,phonenumber,avatar){
//     const fd = new FormData();
//     fd.append('firstname',firstname)
//     fd.append('lastname',lastname)
//     fd.append("email",email)
//     fd.append('pwd',pwd)
//     fd.append('phonenumber',phonenumber)
//     fd.append('avatar',avatar)

//     $.ajax({
//         url:"../../Back/Register/register.php",
//         type:"POST",
//         dateType:"json",
//         data:fd,
//         contentType: false,
//         processData:false,
//         cache:false,
//         success: (res)=>{
//             console.log(res);
//         }
//     })
// }

// $("form").submit((event)=>{
//     console.log($("#avatar").val())
//     event.preventDefault(); // J'empèche le rechargement automatique de la page lors de la soumission du formulaire
//     console.log("submit");
//     // Je récupère les valeurs rentrer dans le formulaire
//     const firstname = $("#firstname").val();
//     const lastname = $("#lastname").val();
//     const email = $("#email").val();
//     const pwd = $("#pwd").val();
//     const phonenumber = $("#phonenumber").val();
//     const avatar = $("#avatar").val();

//     CreateUser(firstname,lastname,email,pwd,phonenumber,avatar);
// })