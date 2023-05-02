USE vk;
-- Создайте динамический запрос, который будет выводить имя, email, город
-- и все файлы пользователя в зависимости от введенного id
PREPARE prd FROM 'SELECT 
	u.firstname AS `Имя`,
	u.email,
	p.hometown,
	m.filename 
FROM 
	users u
JOIN
	profiles p
ON
	p.user_id = u.id 
JOIN
	media m
ON
	m.user_id = u.id
WHERE u.id = ?;';
SET @id = 2;
EXECUTE prd USING
@id;

-- Создайте временную таблицу для вычисления количество файлов
-- согласно категориям ( музыка, видео, фото)
CREATE TEMPORARY TABLE AmountOfFiles
(
	Id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL ,
	Amount INT NULL
);

-- Создайте представление, в котором будут отображены сгруппированные по городам
-- пользовательские атрибуты ( name = firstname+lastname, age(возраст))
CREATE VIEW GroupedUsersByHometown
AS
	SELECT
		concat(u.firstname, " ", u.lastname) AS 'name',
		(
	 	YEAR(current_date) - YEAR(p.birthday) -
		(date_format(current_date, '%m%d') < date_format
(p.birthday, '%m%d'))
	) AS 'age'
FROM 
	profiles p
RIGHT JOIN users u
ON p.user_id = u.id
ORDER BY p.hometown;

-- Создайте представление, в котором будут отображены сгруппированные по группам 
-- имена пользователей
CREATE VIEW Grouped_Users_By_Communities
AS
	SELECT
		concat(u.firstname, " ", u.lastname) AS 'Name',
		c.name AS 'Community'
	FROM
		users u
		JOIN users_communities uc ON uc.user_id = u.id
		JOIN communities c ON c.id = uc.community_id
	ORDER BY c.name;


-- Создайте транзакцию, которая будет вводить нового пользователя:
-- Jack Nicholson 22-04-1937 Neptune JackNIk@gmail.com +123456789
START TRANSACTION;
INSERT INTO users
	(firstname, lastname, email, phone)
values('Jack', 'Nicholson', 'JackNIk@gmail.com', 123456789);
INSERT INTO profiles
	(user_id, birthday)
VALUES
	(101, "1937-04-22");
COMMIT;

-- Создайте транзакцию, которая изменяет город пользователя по имени 
-- Frederik Upton на NewYork
START TRANSACTION;
UPDATE profiles
SET hometown='New York'
WHERE EXISTS (
	SELECT u.firstname
FROM users u
WHERE u.firstname='Frederik' and u.lastname = 'Upton');
COMMIT;
	
