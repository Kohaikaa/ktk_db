use VK;

-- 1. Вывести имена, фамилии и email пользователей в алфавитном порядке по фамилии,
select
	u.firstname, u.lastname, u.email 
from
	users u
order by
	u.lastname asc;

-- 2. Вывести имена всех женщин в алфавитном порядке,
select 
	u.firstname
from 
	users u,
	profiles p
where  p.gender = 'f';

-- 3. Вывести имена и фамилии 5 первых пользователей,
select 
	u.firstname,
	u.lastname 
from
	users u
limit 5;

-- 4. Вывести все названия файлов с фотографиями, у которых размер файла не превышает 100 000
select m.filename 
from media m
where m.`size` <= 100000 and m.media_type_id = 1;

-- 5. Вывести все города, в которых находятся пользователи
select p.hometown
from profiles p, users u
where p.user_id = u.id;

-- 6. Вывести все файлы, которые загрузил пользователь по имени Frederik Upton
select *
from media m
where m.user_id = 2;

-- 7. Посчитайте количество женщин и количество мужчин
select *
from (
	select
		count(p.gender)
	from
		profiles p
	where
		p.gender = 'f' 
) as f,
	(select
		count(p.gender)
	from
		profiles p
	where
	p.gender = 'm'
) as m;

-- 8. Найдите все города пользователей, начинающиеся на букву 'P'
select p.hometown  from profiles p where p.hometown like 'p%';

-- 9. Выведите имя самого молодого пользователя
select *
from
	profiles p
where
	p.birthday = (select max(birthday) from profiles); 

-- 10. Выведите количество женщин из каждого города
select count(p.gender), p.hometown
from profiles p
group by p.hometown;