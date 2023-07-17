-- all movies
select * from movies;

-- all movie from 1984
select * from movies where year = 1984;

-- idem + sort by title
select * 
from movies 
where year = 1984
order by title;

-- url poster conan the destroyer
select title, poster_uri
from movies
where title = 'Conan the Destroyer';

-- movies (title, year) qui contiennent le mot: terminator
select title, year
from movies
where title like '%Terminator%'
order by year;

-- movies (title, year) with director containing word Terminator
select 
	upper(m.title) as title, 
	m.year, 
	m.director_id,
	p.name
from 
	movies m 
	inner join persons p on m.director_id = p.id
where 
	m.title like '%Terminator%'
order by m.year;

select * from persons where id = 116;

-- movies (title, year) played by Clint Eastwood
select 
 	m.title,
	m.year,
	pn.name,
	pl.role
from 
	movies m 
	inner join play pl on pl.movie_id = m.id
	inner join persons pn on pl.actor_id = pn.id
where
	pn.name = 'Clint Eastwood'
order by m.year;

-- movies (title, year) directed by Clint Eastwood
select
	m.title,
	m.year,
	p.name
from
	movies m 
	inner join persons p on m.director_id = p.id
where 
	p.name = 'Clint Eastwood'
order by m.year;	








