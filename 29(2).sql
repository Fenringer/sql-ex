/*
В предположении, что приход и расход денег на каждом пункте приема фиксируется не чаще одного раза в день 
[т.е. первичный ключ (пункт, дата)], 
написать запрос с выходными данными (пункт, дата, приход, расход). 
Использовать таблицы Income_o и Outcome_o.
*/

-- I вариант  cost: 0.012286799959838
select coalesce(inc.point,outc.point) point, coalesce(inc.date,outc.date) date, inc, out
from
income_o inc full join outcome_o outc on inc.point=outc.point and inc.date=outc.date

-- II вариант cost: 0.027291819453239
select b.point,b.date,inc,out
from (
select a.point,a.date,inc,out
from (
select point,date from income_o
union 
select point,date from outcome_o
group by point,date
     ) a
left join Income_o on a.date=Income_o.date and a.point=Income_o.point
left join Outcome_o on a.date=Outcome_o.date and a.point=Outcome_o.point
     ) b
group by point, date,inc,out