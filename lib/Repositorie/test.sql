-- Créer un utilisateur autorisé à se connecter depuis n'importe quelle adresse IP
CREATE USER 'root'@'%' IDENTIFIED BY 'votre_mot_de_passe';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

-- Mettre à jour le fichier de configuration MySQL pour accepter les connexions à distance
-- Assurez-vous que bind-address est configuré à 0.0.0.0 dans my.cnf (ou my.ini)
