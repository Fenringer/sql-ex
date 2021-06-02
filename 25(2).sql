/*
Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM 
и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM. 
Вывести: Maker
*/
--UNSOLVED

SELECT * FROM 
			(SELECT * FROM Product JOIN (
					SELECT model m , speed, ram, price
					FROM pc	
					WHERE ram IN (SELECT MIN(ram)FROM pc)) a 
					ON Product.model = a.m) b
WHERE speed IN (SELECT MAX(speed) FROM b)

