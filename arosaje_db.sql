CREATE TABLE user (
    id_user INTEGER(11) AUTO_INCREMENT NOT NULL PRIMARY KEY, 
    nom VARCHAR(255),
    prenom VARCHAR(255),
    email VARCHAR(255),
    mot_de_passe VARCHAR(255),
    user_type INTEGER(11),
    telephone INTEGER(11),
    avatar VARCHAR(255)
);

CREATE TABLE plantes (
    id_plante INTEGER(11) AUTO_INCREMENT NOT NULL PRIMARY KEY, 
    name_plante VARCHAR(255) NOT NULL, 
    image VARCHAR(255) NOT NULL, 
    localisation VARCHAR(255) NOT NULL, 
    id_user INTEGER(11),
    FOREIGN KEY (id_user) REFERENCES user(id_user)
);


CREATE TABLE reservation (
    id_reservation INTEGER(11) AUTO_INCREMENT NOT NULL PRIMARY KEY, 
    id_plante INTEGER(11),
    id_user INTEGER(11),
    id_guardian INTEGER(11),
    FOREIGN KEY (id_plante) REFERENCES plantes(id_plante),
    FOREIGN KEY (id_user) REFERENCES user(id_user)
);

CREATE TABLE reservation_images (
    id_user INTEGER(11),
    image VARCHAR(255),
    date_image VARCHAR(255),
    id_reservation INTEGER(11),
    FOREIGN KEY (id_user) REFERENCES user(id_user),
    FOREIGN KEY (id_reservation) REFERENCES reservation(id_reservation)
);

CREATE TABLE historique_tchat (
    id_user INTEGER(11),
    id_destinataire INTEGER(11) NOT NULL,
    message VARCHAR(255) NOT NULL, 
    image VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_user) REFERENCES user(id_user)
);

