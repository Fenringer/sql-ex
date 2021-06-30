/*
    Для классов, имеющих потери в виде потопленных кораблей 
    и не менее 3 кораблей в базе данных, 
    вывести имя класса и число потопленных кораблей.
*/
--select * from classes
--select * from outcomes
--select * from ships

with cte_SunkShips as (
    select name
        , class
        , case result when 'sunk' then 1 else 0 end result
    from (
            select coalesce(name,class) as name
                , class
            from (
                select name, class 
                from Ships 
                union  
                select null, class 
                from classes
            ) a
        ) s
        LEFT JOIN Outcomes o ON o.ship=s.name
            AND result = 'sunk'
)
select class
    , sum(result) as SunkQty
from cte_SunkShips
WHERE class in (
        select class 
        from cte_SunkShips
        where result = 1
    )
group by class
having count(*) >=3
