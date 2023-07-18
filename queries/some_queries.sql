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

-- nb movies by year sorted by nb descending
select
	year, 
	count(*) as nb_movie,
	count(id) as nb_id,
	count(duration) as nb_duration
from movies
group by year
order by nb_movie desc;

insert into movies (title, year) values ('Guardians of the Galaxy Vol. 3', 2023);

-- director name, nb movies, first year, last year, total duration of movies 
-- by director having directed more than 10 movies
select 
	pe.name, 
	count(m.id) as nb_movies, 
	min(m.year) as first_year, 
	max(m.year) as last_year, 
	sum(duration) as total_duration_min
from 
	movies m 
	inner join persons pe on pe.id=m.director_id
group by pe.id, pe.name
having count(*) > 10
order by nb_movies desc, pe.name;

-- intermediary step
select 
	pe.id, pe.name,
	m.id, m.title, m.year, m.director_id
from 
	movies m 
	inner join persons pe on pe.id=m.director_id
order by pe.id, pe.name;













