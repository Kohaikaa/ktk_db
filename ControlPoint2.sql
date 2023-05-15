-- Простые запросы

-- Клиенты, работающие в компании.
SELECT
 c.FirstName,
 c.LastName,
 c.Email
FROM
 customers c
where c.Company is not null;

-- Названия альбомов начинающиеся на «А»
select 
	a.Title
from 
	albums a
where a.Title like "A%"


-- Запросы с агрегациями
-- Клиенты из США
SELECT
 COUNT(c.LastName) AS NameCountStartsWithB
FROM
 customers c
WHERE
 LastName LIKE 'B%'
 
select
	any_value(concat(c.FirstName, " ", c.LastName)) as Fullname,
	c.Country
from
	customers c
where c.Country = 'USA'
group by Fullname;
 
-- Сложные запросы с объединением 2-3 таблиц с помощью Join 2-3
-- Клиенты, проживающие в Германии с выплатой меньше 10
select
	c.FirstName,
 	c.LastName,
 	i.InvoiceId,
 	i.CustomerId,
 	c.Country,
 	i.InvoiceDate,
 	i.Total
FROM
	invoices AS i

INNER JOIN
	customers AS c
ON
	i.CustomerId = c.CustomerId
where (i.Total <= 10) and c.Country = 'Germany'
ORDER BY
	c.LastName

	
-- Клиенты, к которым привязан личной сотрудник.
SELECT
 e.FirstName,
 e.LastName,
 e.EmployeeId,
 c.FirstName,
 c.LastName,
 c.SupportRepId,
 i.CustomerId,
 i.Total
FROM
 invoices AS i
INNER JOIN
 customers AS c
ON
 i.CustomerId = c.CustomerId
INNER JOIN
 employees AS e
ON
 c.SupportRepId = e.EmployeeId
ORDER BY
 i.Total DESC
LIMIT 10

-- Сложные запросы с объединением 2-3 таблиц подзапросами 2-3
-- Имя артиста и название альбома
select
	(select a2.Name from artists a2 where a2.ArtistId = a.ArtistId) as "Artist Name",
	a.Title as "Album title"
from
	albums a;

-- Треки, их жанр и в какому альбоме они находятся
select 
	t.Name,
	(select a.Title  from albums a where a.AlbumId = t.AlbumId ) as "Album title",
	(select gen.Name  from genres gen where gen.GenreId = t.GenreId) as "Genre"
from 
	tracks t;