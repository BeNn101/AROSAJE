// const express = require('express');
// const bodyParser = require('body-parser');
// const nodemailer = require('nodemailer');
// const app = express();
// const cors = require('cors');
// const port = 3001;

// app.use(cors()); 
// app.use(bodyParser.json());

// app.post('/send-email', (req, res) => {
//     const { firstName, lastName, email } = req.body;

//     let transporter = nodemailer.createTransport({
//         service: 'gmail',
//         auth: {
//             user: 'salmon.hugo69330@gmail.com',
//             pass: 'cleu fufd ghyc xmad',
//         },
//     });

//     const mailOptions = {
//         from: email,
//         to: 'salmon.hugo69330@gmail.com',
//         subject: `Message de ${firstName} ${lastName}`,
//         text: `Bonjour ${firstName} ${lastName},\n Merci de vous être inscrit. Bienvenue dans la famille Arosaje !`,
//     };

//     transporter.sendMail(mailOptions, (error, info) => {
//         if (error) {
//             res.status(500).send({ message: 'Erreur lors de l\'envoi de l\'email', error });
//         } else {
//             res.status(200).send({ message: 'Félicitations ! Vous êtes inscrit. Email de confirmation envoyé.' });
//         }
//     });
// });

// app.listen(port, () => {
//     console.log(`Serveur en écoute sur le port ${port}`);
// });

