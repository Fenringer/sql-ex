/*
    Найти производителей, которые выпускают более одной модели, 
    при этом все выпускаемые производителем модели являются продуктами одного типа.
    Вывести: maker, type
*/

select r.maker, p.type
from Product as p
    join (
        SELECT maker
        from Product 
        group by maker
        having count(distinct type) = 1
    ) as r on r.maker = p.maker
group by r.maker, p.type
having count(model) > 1