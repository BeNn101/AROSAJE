CREATE TABLE users (
    users_id INTEGER(11) auto_increment NOT NULL,
    email VARCHAR(255) NOT NULL,
    lastname VARCHAR(45) NOT NULL,
    firstname VARCHAR(45) NOT NULL,
    user_name VARCHAR(45) NOT NULL,
    pwd VARCHAR(70) NOT NULL,
    newsletter TINYINT(1) NOT NULL, 
    admin TINYINT(1) NOT NULL,
    PRIMARY KEY (users_id)

);

CREATE TABLE sneakers (
    sneakers_id INTEGER(11) auto_increment NOT NULL,
    users_id INTEGER(11) NULL,
    size INT(11) NOT NULL,
    color VARCHAR(45) NOT NULL,
    brand VARCHAR(45) NOT NULL,
    states VARCHAR(45) NOT NULL,
    price DECIMAL(11) NOT NULL,
    image VARCHAR(255) NOT NULL,
    stock INT(11) NOT NULL,
    PRIMARY KEY(sneakers_id),
    FOREIGN KEY(users_id) REFERENCES users(users_id)

);

CREATE TABLE orders (
    number_order INT(11) auto_increment NOT NULL,
    users_id INT(11) NOT NULL,
    id_sneakers INT(11) NOT NULL,
    etat_c VARCHAR(45) NOT NULL,
    date_de_commande DATETIME NOT NULL,
    PRIMARY KEY (number_order),
    FOREIGN KEY (users_id) REFERENCES users(users_id),
    FOREIGN KEY (id_sneakers) REFERENCES sneakers(sneakers_id)
);

CREATE TABLE Order_Sneakers (
    number_order INT(11) NOT NULL,
    sneakers_id INT(11) NOT NULL,
    PRIMARY KEY (number_order,sneakers_id),
    FOREIGN KEY (number_order) REFERENCES orders(number_order),
    FOREIGN KEY (sneakers_id) REFERENCES sneakers(sneakers_id)
);

CREATE TABLE shopping_list (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Identifiant unique pour chaque entrée
    sneakers_id INT NOT NULL,          -- Identifiant de la sneaker
    users_id INT NOT NULL,             -- Identifiant de l'utilisateur
    brand VARCHAR(255) NOT NULL,       -- Marque de la sneaker
    price DECIMAL(10, 2) NOT NULL,     -- Prix de la sneaker
    image VARCHAR(255) NOT NULL,       -- Chemin ou nom de l'image
    stock INT NOT NULL,                -- Stock disponible
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Date de création
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Dernière mise à jour
    FOREIGN KEY (sneakers_id) REFERENCES sneakers(id) ON DELETE CASCADE, -- Clé étrangère pour sneakers
    FOREIGN KEY (users_id) REFERENCES users(id) ON DELETE CASCADE        -- Clé étrangère pour users
);

