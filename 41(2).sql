/*
Для каждого производителя, у которого присутствуют модели хотя бы в одной из таблиц 
PC, Laptop или Printer, определить максимальную цену на его продукцию.
Вывод: имя производителя, 
если среди цен на продукцию данного производителя присутствует NULL, 
то выводить для этого производителя NULL, иначе максимальную цену.
*/

--------------------------------------------------------
SELECT maker, max(price)--, iif(pp.price is null, null, max(price)) as price
FROM Product P
    left JOIN (
        SELECT model, price FROM PC 
        union all
        SELECT model, price FROM Laptop 
        union all
        SELECT model, price FROM Printer 
    ) pp ON P.model=pp.model
GROUP BY maker--,price

--------------------------------------------------------
SELECT maker, max(price)--, iif(pp.price is null, null, max(price)) as price
--select *
FROM (
    select maker,p.model,type,price
    from Product P
    left JOIN (
        SELECT model, price FROM PC 
        union all
        SELECT model, price FROM Laptop 
        union all
        SELECT model, price FROM Printer 
    ) pp ON P.model=pp.model
    ) as fff

GROUP BY maker--,price

--------------------------------------------------------
SELECT maker, max(price)
--select *
FROM Product P
    left JOIN (
        SELECT model, price FROM PC 
        union all
        SELECT model, price FROM Laptop 
        union all
        SELECT model, price FROM Printer 
    ) pp ON P.model=pp.model
where not EXISTs (
    SELECT distinct maker
    FROM Product P
    left JOIN (
        SELECT model, price FROM PC 
        union all
        SELECT model, price FROM Laptop 
        union all
        SELECT model, price FROM Printer 
        ) pp ON P.model=pp.model
    where price is null
    and maker = p.maker
    )
GROUP BY maker

--------------------------------------------------------
SELECT distinct p.maker, max(pp.price)
--select *
FROM Product P
    left JOIN (
        SELECT model, price FROM PC 
        union all
        SELECT model, price FROM Laptop 
        union all
        SELECT model, price FROM Printer 
        ) pp ON P.model=pp.model
    join (
        select maker,uu.price--,pr.model
        FROM Product Pr
        left JOIN (
            SELECT model, price FROM PC 
            union all
            SELECT model, price FROM Laptop 
            union all
            SELECT model, price FROM Printer 
            ) uu ON Pr.model=uu.model
        --where price is not null
        group by maker,uu.price--,pr.model
        having price is not null
        ) as ddd on ddd.maker=p.maker
GROUP BY p.maker