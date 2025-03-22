CREATE TABLE users (
    users_id INTEGER(11) AUTO_INCREMENT NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    lastname VARCHAR(45) NOT NULL,
    firstname VARCHAR(45) NOT NULL,
    user_name VARCHAR(45) NOT NULL UNIQUE,
    pwd VARCHAR(70) NOT NULL,
    newsletter TINYINT(1) NOT NULL, 
    admin TINYINT(1) NOT NULL,
    PRIMARY KEY (users_id)
);

CREATE TABLE sneakers (
    sneakers_id INTEGER(11) AUTO_INCREMENT NOT NULL,
    size INT(11) NOT NULL,
    color VARCHAR(45) NOT NULL,
    brand VARCHAR(45) NOT NULL,
    states VARCHAR(45) NOT NULL,
    price DECIMAL(11,2) NOT NULL,
    image VARCHAR(255) NOT NULL,
    stock INT(11) NOT NULL,
    PRIMARY KEY(sneakers_id)
);

CREATE TABLE user_sneakers (
    users_id INTEGER(11) NOT NULL,
    sneakers_id INTEGER(11) NOT NULL,
    date_acquisition DATE NOT NULL,
    PRIMARY KEY (users_id, sneakers_id),
    FOREIGN KEY (users_id) REFERENCES users(users_id),
    FOREIGN KEY (sneakers_id) REFERENCES sneakers(sneakers_id)
);

CREATE TABLE orders (
    order_id INT(11) AUTO_INCREMENT NOT NULL,
    buyer_id INT(11) NOT NULL,  -- Utilisateur qui achète
    seller_id INT(11) NOT NULL, -- Utilisateur qui vend
    etat_c VARCHAR(45) NOT NULL,
    date_de_commande DATETIME NOT NULL,
    PRIMARY KEY (order_id),
    FOREIGN KEY (buyer_id) REFERENCES users(users_id),
    FOREIGN KEY (seller_id) REFERENCES users(users_id)
);

CREATE TABLE order_sneakers (
    order_id INT(11) NOT NULL,
    sneakers_id INT(11) NOT NULL,
    quantity INT(11) NOT NULL DEFAULT 1,
    price DECIMAL(11,2) NOT NULL,
    PRIMARY KEY (order_id, sneakers_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (sneakers_id) REFERENCES sneakers(sneakers_id)
);

CREATE TABLE shopping_list (
    id INT AUTO_INCREMENT PRIMARY KEY,
    users_id INT NOT NULL, 
    sneakers_id INT NOT NULL,
    brand VARCHAR(255) NOT NULL, 
    price DECIMAL(10,2) NOT NULL, 
    image VARCHAR(255) NOT NULL, 
    stock INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (users_id) REFERENCES users(users_id),
    FOREIGN KEY (sneakers_id) REFERENCES sneakers(sneakers_id)
);
