/*
	В предположении, что приход и расход денег на каждом пункте приема фиксируется произвольное число раз (первичным ключом в таблицах является столбец code), 
	требуется получить таблицу, в которой каждому пункту за каждую дату выполнения операций будет соответствовать одна строка.
	Вывод: point, date, суммарный расход пункта за день (out), суммарный приход пункта за день (inc). 
	Отсутствующие значения считать неопределенными (NULL).
*/

select a.point, a.date, outcome, income  
from (	
		select point, date 
		from income
		union 
		select point, date 
		from outcome
		group by point, date
	) as a
	left join (
			select point, date, coalesce(
					sum(out), NULL
				) as outcome 
			from outcome 
			group by point, date
		) as o on o.date=a.date 
		and o.point=a.point
	left join (
			select point, date, coalesce(
					sum(inc), NULL
				) as income 
			from income 
			group by point, date
		) as i on i.date=a.date 
		and i.point=a.point
