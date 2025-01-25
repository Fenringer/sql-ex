/*
    По Вашингтонскому международному договору от начала 1922 г. запрещалось строить линейные корабли водоизмещением более 35 тыс.тонн. 
    Укажите корабли, нарушившие этот договор (учитывать только корабли c известным годом спуска на воду). 
    Вывести названия кораблей.

    Classes (class, type, country, numGuns, bore, displacement)
    Ships (name, class, launched)
    Battles (name, date)
    Outcomes (ship, battle, result)
*/

select name 
from ships, classes 
    --join classes on Classes.class=Ships.class
where Classes.class=Ships.class
and Classes.displacement > 35000
and ships.launched >= 1922
and ships.launched is not null
and Classes.type = 'bb'
    --order by displacement asc