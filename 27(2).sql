/*
Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры. 
Вывести: maker, средний размер HD.
*/
 
--I вариант
select maker, avg(hd) as avg_hd
from product join pc on product.model=pc.model
where maker in (select maker from product where type = 'printer')
group by maker

--II вариант
/*
select maker, avg(hd)
from (
	select maker, hd
	from pc join product on pc.model=product.model
	where maker in 
		(
		select maker
		from product
		where product.type = 'printer'
		)
     ) result
group by maker
*/