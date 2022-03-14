CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER 'wp_user' IDENTIFIED BY 'userpassword';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_user'@'localhost' IDENTIFIED BY 'userpassword';
grant all privileges on *.* to 'wp_user'@'localhost' with grant option;

FLUSH PRIVILEGES;