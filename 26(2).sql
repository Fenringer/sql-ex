/*
	Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква). 
	Вывести: одна общая средняя цена.
*/
select avg(price) as avg_price
from (
	select maker,price 
	from pc 
	join product on product.model = pc.model 
	where product.maker = 'A'
	union all
	select maker,price 
	from laptop 
	join product on product.model = laptop.model 
	where product.maker = 'A'
	) as d
