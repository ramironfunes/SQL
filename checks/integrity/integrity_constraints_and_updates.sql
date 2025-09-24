USE Mysql;


DROP USER IF EXISTS 'kraken@localhost';
DROP USER IF EXISTS 'ASkywalker';
CREATE USER IF NOT EXISTS 'kraken@localhost' IDENTIFIED BY 'ramiro123'; -- Creamos el usuario kraken@localhost
CREATE USER IF NOT EXISTS 'ASkywalker' IDENTIFIED BY 'casa123'; -- Creamos el usuario ASkywalker
GRANT SELECT ON fastfood.* TO 'ASkywalker'; -- Le otorgamos el permiso de solo lectura al usuario ASkywalker
GRANT SELECT,INSERT,UPDATE ON fastfood.* TO 'kraken@localhost'; -- Le otorgamos el permiso de lectura, insercion de datos y modificaciones al usuario kraken@gmail.com
