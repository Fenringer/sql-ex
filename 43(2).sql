/*
Укажите сражения, которые произошли в годы, 
не совпадающие ни с одним из годов спуска кораблей на воду.
*/

select name from battles
where year(date) not in (
    select CASE 
        WHEN launched IS NULL 
        THEN 1900 
        ELSE launched 
        END dlaunched
    FROM Outcomes FULL JOIN Ships ON Outcomes.ship = Ships.name
    where launched <> battles.date
        --зачем это условие where?
    )
