/*
Найдите названия кораблей, потопленных в сражениях, 
и название сражения, в котором они были потоплены.
*/

select ship, battle 
from outcomes 
where result = 'sunk'