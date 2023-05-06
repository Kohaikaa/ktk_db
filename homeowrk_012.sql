USE vk;

-- Создайте хранимую процедуру, которая создает временную таблицу
-- для подсчета из каких городов пользователи в бд.
DELIMITER //
CREATE PROCEDURE creating_temp_table()
BEGIN
	CREATE TEMPORARY TABLE users_from_city
	SELECT
		p.hometown,
		count(*) AS 'Amount of people'
	FROM profiles p
	GROUP BY p.hometown;
END //
DELIMITER ;

-- Создайте триггер, который при удалении пользователя удаляет также его файлы
DELIMITER //
CREATE TRIGGER deleting_media_with_user AFTER DELETE ON vk.users
FOR EACH ROW
BEGIN
	DELETE FROM media m
	WHERE m.user_id = OLD.id;
END //
DELIMITER ;

-- Создайте триггер, который при добавлении пользователя проверяет его дату рождения
-- и устанавливает текущую дату, если дата из "будущего"
DELIMITER //
CREATE TRIGGER checking_date BEFORE INSERT ON vk.profiles
FOR EACH ROW
	IF NEW.birthday > curdate() THEN SET NEW.birthday = curdate(); 
END IF //
DELIMITER ;

-- Создайте триггер, который при обновлении данных в таблице media будет ставить текущую дату 
-- и время в колонку updated_at
DELIMITER //
CREATE TRIGGER updating_media_time BEFORE UPDATE ON vk.media
FOR EACH ROW
SET NEW.updated_at = curdate(); 
DELIMITER ;

-- Создайте триггер, который проверяет на правильность ввод данных о пользователе при вставке
-- нового пользователя ( firstname и lastname, email не должны быть пустыми, phone начинается с 7),
-- и выводит на экран ошибку "Invalid user data"
DELIMITER //
CREATE TRIGGER validating_users BEFORE INSERT ON vk.users
-- IF 	(isnull(NEW.firstname) OR
-- 	isnull(NEW.lastname) OR
-- 	isnull(NEW.email) OR
-- 	NEW.phone LIKE '%7%')
IF NEW.firstname IS NULL
THEN SIGNAL SQLSTATE '45000' SET message_text = 'Invalid user data';
END IF //
DELIMITER ;

-- Создайте функцию, которая удаляет пользователя по id вместе с его профилем
DROP FUNCTION IF EXISTS delete_user_by_id;
DELIMITER //
CREATE FUNCTION delete_user_by_id(user_id bigint)
RETURNS bigint READS SQL DATA NOT DETERMINISTIC
BEGIN
	DELETE FROM profiles p WHERE p.user_id = user_id;
	DELETE FROM users u WHERE u.id = user_id;
	RETURN user_id;
END //
DELIMITER ;

-- Создайте функцию hello(), которая будет возвращать приветствие,
-- в зависимости от текущего времени суток.
-- С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро",
-- с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
-- с 18:00 до 00:00 — "Добрый вечер",
-- с 00:00 до 6:00 — "Доброй ночи"

DROP FUNCTION IF EXISTS hello;
DELIMITER //
CREATE FUNCTION hello()
RETURNS varchar(255) DETERMINISTIC
BEGIN
	DECLARE cur_time time;
	DECLARE `result` VARCHAR(50);
	SET	cur_time = current_time(); 
	CASE
		WHEN cur_time BETWEEN '6:00:00'  AND '12:00:00' THEN SET `result`='Доброе утро';
		WHEN cur_time BETWEEN '12:00:00' AND '18:00:00' THEN SET `result`='Добрый день';
		WHEN cur_time BETWEEN '18:00:00' AND '00:00:00' THEN SET `result`='Добрый вечер';
		WHEN cur_time BETWEEN '00:00:00' AND '06:00:00' THEN SET `result`='Доброй ночи';
	END CASE;
	RETURN `result`;
END //
DELIMITER ;