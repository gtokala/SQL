-- Here greatest() will o/p 2800 if sal is less than 2800. If the Sal is greater than 2800 then Sal value be o/p.
-- least() will o/p 1000 if Sal is greater than 1000 and Sal is less than 1000 then Sal o/p
select emp.*, greatest(sal, 2500, 2700, 2800), least(sal,1500, 1000) from emp;
