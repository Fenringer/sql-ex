/*
Для каждого корабля, участвовавшего в сражении при Гвадалканале (Guadalcanal), 
вывести название, водоизмещение и число орудий.
*/

SELECT ship, displacement, numGuns 
FROM Outcomes
left JOIN Ships ON Ships.name = outcomes.Ship
left JOIN Classes ON Classes.Class = Ships.Class 
    or Classes.Class = outcomes.Ship
WHERE  battle = 'Guadalcanal'