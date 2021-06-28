/*
Найдите страны, 
имевшие когда-либо классы обычных боевых кораблей ('bb') и 
имевшие когда-либо классы крейсеров ('bc').
*/

select country 
from (
    select country 
    from classes 
    where type = 'bb'
    intersect 
    select country 
    from classes 
    where type = 'bc'
    ) c