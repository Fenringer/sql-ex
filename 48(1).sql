/*
Найдите классы кораблей, в которых хотя бы один корабль был потоплен в сражении.
*/

select classes.class 
from (
    select class 
    FROM ships 
    join outcomes on ships.name = outcomes.ship
    where result = 'sunk'
    union
    select ship 
    FROM outcomes 
    where result = 'sunk'
    ) xx
join classes on classes.class = xx.class