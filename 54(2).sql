/*
    С точностью до 2-х десятичных знаков 
    определите среднее число орудий всех линейных кораблей 
    (учесть корабли из таблицы Outcomes).
*/

with io as (
    select ship as name 
    from outcomes
    union 
    select name 
    from ships
)
Select CONVERT(NUMERIC(4,2),AVG(numGuns*1.0)) as AvgNG
from io 
	left join ships on io.name = ships.name
	join classes on classes.class=ships.class 
        or io.name=classes.class
where type = 'bb'