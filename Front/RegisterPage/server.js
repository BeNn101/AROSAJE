const express = require('express');
const bodyParser = require('body-parser');
const nodemailer = require('nodemailer');
const cors = require('cors'); 
const app = express();
const port = 3000;

app.use(cors()); 
app.use(bodyParser.json());

app.post('/send-email', (req, res) => {
    const { firstName, lastName, email } = req.body;

    let transporter = nodemailer.createTransport({
        service: 'gmail',
        auth: {
            user: 'salmon.hugo69330@gmail.com',
            pass: 'cleu fufd ghyc xmad',
        },
    });

    const mailOptions = {
        from: 'salmon.hugo69330@gmail.com',
        to: email,
        subject: 'Bienvenue sur AROSAJE !',
        text: `Bonjour ${firstName} ${lastName},\n\nNous vous souhaitons la bienvenue sur AROSAJE, la plateforme dédiée à la réservation de plantes et aux conseils de botanistes. 
        Nous sommes ravis de vous compter parmi nos utilisateurs !\n\nVotre compte a été créé avec succès, et vous pouvez dès à présent vous connecter pour découvrir nos services.\n\n
        Si vous avez des questions ou besoin d'aide, n'hésitez pas à nous contacter.\n\nCordialement,\nL'équipe AROSAJE`,
    };

    transporter.sendMail(mailOptions, (error, info) => {
        if (error) {
            res.status(500).send({ message: "Erreur lors de l'envoi de l'email", error });
        } else {
            res.status(200).send({ message: 'Bienvenue sur AROSAJE ! Un mail de confirmation a été envoyé.' });
        }
    });
});


app.listen(port, () => {
    console.log(`Serveur en écoute sur le port ${port}`);
});
