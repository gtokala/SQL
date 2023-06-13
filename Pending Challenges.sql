-- trim reddy from first and last keep middle one
select 'reddy govardhan reddy tokala reddy' from dual;

--This query replaces all reddy words in string but the requirement is to keep the middle reddy
--TRIM with more than one Char is working in MS SQL Server but not in Oracle. Oracle is only taking single char
select replace(name, 'reddy') from
(select 'reddy govardhan reddy tokala reddy' as name from dual);
