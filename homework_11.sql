USE vtunes;

-- создайте 3х пользователей с хэшированными паролями:
-- superuser, admin, username.

-- superuser имеет полный доступ к вашей базе данных
DROP USER IF EXISTS superuser@localhost;
CREATE USER superuser@localhost IDENTIFIED WITH sha256_password BY 'password';
GRANT ALL ON vtunes.* TO superuser@localhost;

-- admin может выполнять все типы запросов (SELECT, UPDATE, DELETE, INSERT)
DROP USER IF EXISTS admin@localhost;
CREATE USER admin@localhost IDENTIFIED WITH sha256_password BY 'password';
GRANT SELECT, UPDATE, DELETE, INSERT ON vtunes.* TO admin@localhost;

-- username имеет доступ только к SELECT запросам к одной любой таблице
DROP USER IF EXISTS username@localhost;
CREATE USER username@localhost IDENTIFIED WITH sha256_password BY 'password';
GRANT SELECT ON vtunes.tracks TO username@localhost;


-- Переименуйте пользователя username на user, добавьте ему привилегий,
-- чтобы он мог делать SELECT и INSERT запросы к любой другой таблице
RENAME USER username@localhost TO 'user'@localhost;
GRANT SELECT, INSERT ON vtunes.* TO 'user'@localhost;

-- Удалите пользователя admin
DROP USER admin@localhost;