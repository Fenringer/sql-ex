/*
    Найдите названия кораблей, имеющих наибольшее число орудий среди 
    всех имеющихся кораблей такого же водоизмещения 
    (учесть корабли из таблицы Outcomes).
*/

--select * from ships
--select * from Classes
with cte_AllShips as (
    select name, displacement, numguns
    from classes
        join (
                select name, class
                from ships
                union 
                select ship, ship 
                from Outcomes 
            ) aaa on classes.class = aaa.class
)

select name
from cte_AllShips as bbb
where numguns >= all (
        select numguns
        from cte_AllShips
        where bbb.displacement = displacement
    )

----------------------------------------------------------------
/*
select name, displacement, numguns
into #AllShips
    from classes
        join (
                select name, class
                from ships
                union 
                select ship, ship 
                from Outcomes 
            ) aaa on classes.class = aaa.class

select *
from #AllShips as bbb
where numguns >= all (
        select numguns
        from #AllShips
        where bbb.displacement = displacement
    )
drop table #AllShips
*/

/*
SELECT *--ship, displacement, numGuns 
FROM Outcomes
left JOIN Ships ON Ships.name = outcomes.Ship
left JOIN Classes ON Classes.Class = Ships.Class 
    or Classes.Class = outcomes.Ship
*/

/*
SELECT *--coalesce(s.name,o.ship) name--ship, displacement, numGuns 
FROM Classes c
left JOIN Ships s ON s.Class = c.Class
left JOIN Outcomes o ON o.Ship = s.name or o.Ship = c.Class
group by name, displacement 
*/

/*
with io as (
		select ship as name 
		from outcomes
		union 
		select name 
		from ships
	)
Select io.name, displacement
from io 
    left join ships s on io.name = s.name
    join classes c on c.class=s.class 
        or io.name=c.class 
--INTERSECT
--select displacement from classes
group by io.name, displacement

    
    --and numGuns > all(select numGuns from classes)
    --    group by io.name
        --having displacement=displacement
    
    --join classes on 
    --c.numGuns > c.numGuns and 
    --c.displacement = c.displacement
*/

/*
WHERE numGuns > any (
                select numGuns 
                from classes
            )
*/

/*
SELECT *--name
FROM 

(SELECT O.ship AS name, numGuns, displacement
FROM Outcomes O JOIN 
Classes C ON O.ship = C.class

UNION

SELECT S.name AS name, numGuns, displacement 
FROM Ships S JOIN 
Classes C ON S.class = C.class 
) OS 

JOIN 

(SELECT MAX(numGuns) AS MaxNumGuns, displacement
FROM Outcomes O JOIN 
Classes C ON O.ship = C.class AND 
O.ship NOT IN (SELECT name FROM Ships) 
GROUP BY displacement

UNION

SELECT MAX(numGuns) AS MaxNumGuns, displacement
FROM Ships S JOIN 
Classes C ON S.class = C.class
GROUP BY displacement
) GD ON OS.numGuns = GD.MaxNumGuns 
    AND OS.displacement = GD.displacement;
*/


/*
----------------------------------------------------------------
SELECT distinct coalesce(sh.name,ou.ship) name
FROM Ships sh 
    full JOIN Outcomes ou ON ou.ship = sh.name 
    LEFT JOIN Classes cl 
        ON ou.ship = cl.class 
        OR sh.class = cl.class
and cl.numGuns IS NOT NULL              
    LEFT JOIN Classes cl2 
        ON cl.displacement = cl2.displacement 
        AND cl.numGuns < cl2.numGuns
and cl.numGuns IS NOT NULL         
WHERE cl.class IS NOT NULL 
    AND cl2.class IS NULL
*/

/*
----------------------------------------------------------------
select * 
from classes
join (
    select name, class
    from ships
    union 
    select ship, ship 
    from Outcomes 
) ccc on classes.class = ccc.class

LEFT JOIN Classes cl2 
        ON cl.displacement = cl2.displacement 
        AND cl.numGuns < cl2.numGuns
and cl.numGuns IS NOT NULL   
*/