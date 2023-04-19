use vk;
-- 1. Вывести все файлы видео с расширениями .avi и .mp4 
	select
		m.filename
	from
		media m
	where 
	substring_index(m.filename, '.', -1) = 'avi'
union
	select
		m.filename
	from
		media m
	where m.filename like '%.mp4'
-- 2. Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, 
-- который больше всех общался с выбранным пользователем (написал ему сообщений).
select
	concat(u.firstname, " ", u.lastname) as FullName,
	count(m2.from_user_id) as MessagesCount
from
	users u
	join
	friend_requests fr
	on
	fr.target_user_id = 1 or
		fr.initiator_user_id = 1
	join
	messages m2
	on
	m2.to_user_id = 1
where fr.status = 'approved'
group by u.id
limit 1;
-- 3. Подсчитать общее количество лайков, которые получили пользователи младше 11 лет. 
select
	concat(u.firstname, " ", u.lastname) as FullName,
	count(*) as Likes
from
	likes l2
	inner join
	profiles p2
	on
	p2.user_id = l2.user_id
	inner join
	users u
	on
	u.id = p2.user_id
where
	((YEAR(CURRENT_DATE) - YEAR(p2.birthday))
	- (DATE_FORMAT(CURRENT_DATE, '%m%d')
	< DATE_FORMAT(p2.birthday, '%m%d'))
) < 11
group by l2.user_id;

-- 4. Определить кто больше поставил лайков (всего): мужчины или женщины.
select
	CASE
    WHEN gender = 'f' 
        THEN 'Women'
    WHEN gender = 'm'  
        THEN 'Men'
    ELSE 'Не определен'
END AS 'Sex',
	count(*) as "Likes"
from
	likes l
	join
	profiles p
	on
	p.user_id = l.user_id
group by p.gender;


-- 5. Вывести количество групп каждого пользователя
select
	uc.user_id ,
	count(c.id) as "Количество групп"
from
	communities c
	inner join
	users_communities uc
	on
	uc.community_id = c.id
group by uc.user_id;

-- 6. Найти количество пользователей в сообществах
select
	c.name as "Сообщество",
	count(uc.user_id) as "Количество пользователей"
from
	users_communities uc
	inner join
	communities c
	on
	c.id = uc.community_id
group by uc.community_id
;

-- 7. Найти 3 пользователей с наибольшим количеством лайков
select
	u.id,
	u.firstname,
	count(l.user_id)
from
	users u
	inner join
	likes l
	on
l.user_id = u.id
group by l.user_id
limit 3;

