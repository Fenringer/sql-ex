/*
Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM 
и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM. 
Вывести: Maker
*/

-- I вариант
-- cost: 0.040868349373341
WITH io AS
(SELECT maker, Product.model, speed, ram
FROM Product JOIN PC ON Product.model = PC.model 
AND maker IN (SELECT maker FROM Product WHERE type = 'Printer') 
AND ram = (SELECT MIN(ram) FROM PC))
SELECT DISTINCT maker FROM io WHERE speed = (SELECT MAX(speed) FROM io)

-- II вариант
--cost: 0.048855666071177
/*SELECT DISTINCT maker
FROM Product 
WHERE type = 'printer' 
	AND maker IN(
		SELECT maker 
		FROM Product
		WHERE model IN(
			SELECT model 
			FROM PC
			WHERE speed = (
				SELECT MAX(speed)
				FROM (
					SELECT speed 
					FROM PC 
					WHERE ram=(
						SELECT MIN(ram)
						FROM PC
						)
				) AS z4
			)
			and ram=(SELECT MIN(ram) FROM PC)

		)
);*/

