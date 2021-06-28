/*
Укажите корабли, потопленные в сражениях в Северной Атлантике (North Atlantic). 
Вывод: ship.
*/

select ship 
from outcomes
where battle = 'North Atlantic'
    and result = 'sunk'
