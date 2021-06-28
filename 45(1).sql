/*
Найдите названия всех кораблей в базе данных, 
состоящие из трех и более слов (например, King George V).
Считать, что слова в названиях разделяются единичными пробелами, 
и нет концевых пробелов.
*/

select name 
from (
    select ship as name 
    FROM Outcomes 
    union 
    select name 
    FROM Ships
) all_ship_names
where name like '% % %'