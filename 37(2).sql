/*
	Найдите классы, в которые входит только один корабль из базы данных 
	(учесть также корабли в Outcomes).
*/

with nn as (
		select ship as name 
		from outcomes
		union 
		select name 
		from ships
	)
Select classes.class
from nn 
left join ships on nn.name = ships.name
join classes on classes.class=ships.class 
	or nn.name=classes.class
where classes.class is not null
group by classes.class
having count(classes.class) = 1
