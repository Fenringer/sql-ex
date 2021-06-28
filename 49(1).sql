/*
Найдите названия кораблей с орудиями калибра 16 дюймов 
(учесть корабли из таблицы Outcomes).
*/

select all_ship_names.name
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
where classes.bore = 16