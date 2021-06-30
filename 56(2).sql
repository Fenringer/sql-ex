/*
    Для каждого класса определите число кораблей этого класса, 
    потопленных в сражениях. 
    Вывести: класс и число потопленных кораблей.
*/

with cte_SunkShips as (
    select name, class, case result when 'sunk' then 1 else 0 end result
    from classes
        left join (
                select name, class as classs
                from ships
                union 
                select ship, ship 
                from Outcomes 
            ) aaa on classes.class = aaa.classs
        left join outcomes o on o.ship = aaa.name
)
select class, sum(result) as SunkQty
from cte_SunkShips
group by class
