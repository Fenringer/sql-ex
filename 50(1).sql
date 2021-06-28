/*
Найдите сражения, в которых участвовали корабли класса Kongo из таблицы Ships.
*/

----------------------------------------------------------------
select battle
from outcomes
left join Ships on Ships.name=Outcomes.ship
where class = 'kongo'

--select * from outcomes
--select * from Ships

----------------------------------------------------------------
SELECT battle 
FROM Outcomes
left JOIN Ships ON Ships.name = outcomes.Ship  
left JOIN Classes ON Classes.Class = Ships.Class 
    or Classes.Class = outcomes.Ship
WHERE  Classes.class = 'kongo'

----------------------------------------------------------------
SELECT battle 
FROM Outcomes
full JOIN (
    Ships full JOIN Classes ON Classes.Class = Ships.Class
) ON Ships.name = outcomes.Ship 
    or Classes.Class = outcomes.Ship
WHERE  Classes.class = 'kongo'
and battle is not null

----------------------------------------------------------------
select battle
from (
    select ship as name
    FROM Outcomes 
    union 
    select name 
    FROM Ships
) all_ship_names
full join Ships on ships.name = all_ship_names.name
left join classes  on classes.class = ships.class 
    or classes.class = all_ship_names.name
left JOIN Outcomes ON all_ship_names.name = outcomes.Ship
where classes.class = 'kongo'
and battle is not null
