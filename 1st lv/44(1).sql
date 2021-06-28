/*
Найдите названия всех кораблей в базе данных, начинающихся с буквы R.
*/

select name 
from (
    select ship as name 
    FROM Outcomes 
    union 
    select name 
    FROM Ships
) all_ship_names
where name like 'R%'