/*
Перечислите названия головных кораблей, 
имеющихся в базе данных (учесть корабли в Outcomes).
*/

select class from classes  
join (
    select ship  
    FROM Outcomes 
    union 
    select name 
    FROM Ships
    ) as all_ship_names on all_ship_names.ship = classes.class