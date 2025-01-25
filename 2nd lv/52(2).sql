/*
Определить названия всех кораблей из таблицы Ships, 
которые могут быть линейным японским кораблем,
имеющим число главных орудий не менее девяти, 
калибр орудий менее 19 дюймов и 
водоизмещение не более 65 тыс.тонн
*/

SELECT name FROM Ships
JOIN Classes on Classes.class = Ships.class
WHERE type = 'bb'
    AND country = 'japan'
    AND (
        numGuns >= 9 
            or numGuns is null
        )
    AND (
        bore < 19 
            or bore is null
        )
    AND (
        displacement <= 65000 
            or displacement is null
        )