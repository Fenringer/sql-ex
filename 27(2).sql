/*
Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры. 
Вывести: maker, средний размер HD.
*/
--NOT SOLVED
select maker, avg(hd)
from (
      select maker, hd
      from pc join product on pc.model=product.model
      where maker in 
(
select maker
from product 
join printer on printer.model=product.model 
where product.type = 'printer'
group by maker
)
     ) result
group by maker