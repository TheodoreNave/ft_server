CREATE DATABASE wordpress;

CREATE USER 'admin' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'localhost' IDENTIFIED BY 'admin';

FLUSH PRIVILEGES;

GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'admin'@'localhost' IDENTIFIED BY 'admin';

FLUSH PRIVILEGES;