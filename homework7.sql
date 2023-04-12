use vk;
/* 
 1. Создайте запрос, в котором выбирается имена и фамилии в одном 
 столбце, пол, дату рождения пользователей. Дату рождения отформатируйте по образцу: 
 11 April 2023, в графе Пол укажите "Мужчина" или "Женщина"
 */
select
	concat(u.firstname, ' ', u.lastname) as 'Имя Фамилия',
	IF(p.gender = 'f', 'Женщина', 'Мужчина') AS 'Пол',
	DATE_FORMAT(p.birthday, '%d %M %Y')
from
	vk.users u,
	vk.profiles p;

/*
2. Создайте запрос, который выводит имена пользователя и его контакт, если указан email - то email,
если не указан email, но указан телефон, то выдает его, если не указано ничего, то выдает строку "Не задан"
**/
select
	u.firstname as 'Имя',
	coalesce  (u.email, u.phone, 'Не задан') as 'Контакт'
from vk.users u;

/* 
 3. Создайте запрос, который выдает уникальные почтовые сервера email у пользователей. 
 для справки: example@tes.tu  - test.ru - почтовый сервер
 */
select 
	substring_index(u.email, '@', -1) as "Email server"
from users u  

/*
4. Создайте запрос, который выводит имена пользователей (Имя + фамилия) и их возраст, в отдельном столбце 
выводит строку "совершеннолетний" или "не совершеннолетний"
*/
select
	concat(u.firstname, ' ', u.lastname) as 'Имя Фамилия',
	(
		(YEAR(CURRENT_DATE) - YEAR(p.birthday)) -                             
    	(DATE_FORMAT(CURRENT_DATE, '%m%d') < DATE_FORMAT(p.birthday, '%m%d'))
    ) as "Age" ,
    if (
    (
		(YEAR(CURRENT_DATE) - YEAR(p.birthday)) -                             
    	(DATE_FORMAT(CURRENT_DATE, '%m%d') < DATE_FORMAT(p.birthday, '%m%d'))
    ) >= 18,
    'совершеннолетний',
    'не совершеннолетний') as "Status"
from
	vk.users u,
	vk.profiles p;

/*
5. Создайте запрос, который выводит название файла без расширения и его размер, округленный до 10 000.
для справки: test.avi - .avi это расширение файла 
*/
select
	substring_index(m.filename, '.', -1) as 'File extension',
	round(m.`size`, -4)  as 'File size'
from media m;

/*
6. Создайте запрос, который меняет дату всех медиа, созданных пользователем Frederik Upton на текущую дату
*/
update media m
set m.updated_at = now()
where m.user_id = 2;



/*
7. Создайте запрос, который выводит количество пользователей с днями рождениями по месяцам
*/
select
	date_format(p.birthday, '%M') as 'Месяц',
	count(*) as "Количество"
from profiles p
group by date_format(p.birthday, '%M')
order by count(*);