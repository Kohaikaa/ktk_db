-- Простые запросы
SELECT
	c.FirstName,
	c.LastName,
	c.Email
FROM
	customers c
where c.Company is not null;

select
	a.Title
from
	albums a
where a.Title like "A%"


-- Запросы с агрегациями
SELECT
	COUNT(c.LastName) AS NameCountStartsWithB
FROM
	customers c
WHERE
 LastName LIKE 'B%'

select
	any_value(concat(c.FirstName, " ", c.LastName)) as Fullname,
	count(*) as 'Customers from USA',
	c.Country
from
	customers c
where c.Country = 'USA'
group by c.FirstName;

-- Сложные запросы с объединением 2-3 таблиц с помощью Join 2-3
SELECT
	c.LastName,
	c.FirstName,
	i.InvoiceId,
	i.CustomerId,
	i.InvoiceDate,
	i.Total
FROM
	invoices AS i
	INNER JOIN
	customers AS c
	ON
 i.CustomerId = c.CustomerId
ORDER BY
 c.LastName

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
select
	(select a2
.Name from artists a2 where a2.ArtistId = a.ArtistId) as "Artist Name",
	a.Title as "Album title"
from
	albums a;

select
	t.Name,
	(select a.Title
	from albums a
	where a.AlbumId = t.AlbumId ) as "Album title",
	(select gen.Name
	from genres gen
	where gen.GenreId = t.GenreId) as "Genre"
from
	tracks t;