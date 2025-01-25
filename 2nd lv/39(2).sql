/* 
    Найдите корабли, `сохранившиеся для будущих сражений`; 
    т.е. выведенные из строя в одной битве (damaged), 
    они участвовали в другой, произошедшей позже.
*/

with io as (
    select * 
    from outcomes
    join battles on battles.name=outcomes.battle
    )
select distinct s.ship 
from io as s
join io as a on s.battle<>a.battle 
    and s.ship=a.ship 
    and a.date > s.date
where s.result = 'damaged'
