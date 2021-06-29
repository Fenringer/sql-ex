/*
    Для каждого производителя, у которого присутствуют модели хотя бы в одной из таблиц 
    PC, Laptop или Printer, определить максимальную цену на его продукцию.
    Вывод: имя производителя, 
    если среди цен на продукцию данного производителя присутствует NULL, 
    то выводить для этого производителя NULL, иначе максимальную цену.
*/

SELECT maker 
    ,case 
        when count(*) = count(price) 
        then max(price)
        else null
    end as max_price
FROM Product P
     JOIN (
        SELECT model, price FROM PC 
        union all
        SELECT model, price FROM Laptop 
        union all
        SELECT model, price FROM Printer 
    ) pp ON P.model=pp.model
GROUP BY maker