CREATE DATABASE IF NOT EXISTS wordrpess
DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
CREATE USER 'wp_user' IDENTIFIED BY 'userpassword';
GRANT ALL PRIVILEGES ON wordpress.*
  TO 'wp_user'@'localhost' IDENTIFIED BY 'userpassword';
  
FLUSH PRIVILEGES;