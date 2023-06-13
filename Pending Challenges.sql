-- trim reddy from first and last keep middle one
select 'reddy govardhan reddy tokala reddy' from dual;

--This query replaces all reddy words in string but the requirement is to keep the middle reddy
--TRIM with more than one Char is working in MS SQL Server but not in Oracle. Oracle is only taking single char
select replace(name, 'reddy') from
(select 'reddy govardhan reddy tokala reddy' as name from dual);

--MS SQL SERVER
select trim('reddy' from 'reddy govardhan reddy tokala reddy')
,len('reddy govardhan reddy tokala reddy')
,len(' govardhan reddy tokala ')
,len(' govardhan reddy tokala')
,len(trim('reddy' from 'reddy govardhan reddy tokala reddy'))
,datalength(trim('reddy' from 'reddy govardhan reddy tokala reddy'))
,len(trim(trim('reddy' from 'reddy govardhan reddy tokala reddy')))

/*
output
govardhan reddy tokala	34	23	23	23	24	22
*/

/*
This is clearly documented by Microsoft in MSDN at 
http://msdn.microsoft.com/en-us/library/ms190329(SQL.90).aspx, 
which states LEN "returns the number of characters of the specified string expression, excluding trailing blanks"

You need to instead use the DATALENGTH function - see 
http://msdn.microsoft.com/en-us/library/ms173486(SQL.90).aspx
- which "returns the number of bytes used to represent any expression".
*/