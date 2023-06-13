-- trim reddy from first and last keep middle one
select 'reddy govardhan reddy tokala reddy' from dual;

--This query replaces all reddy words in string but the requirement is to keep the middle reddy 
--and output govardhan reddy tokala
--TRIM with more than one Char is working in MS SQL Server but not in Oracle. Oracle is only taking single char
select replace(name, 'reddy') from
(select 'reddy govardhan reddy tokala reddy' as name from dual);
/*Output
govardhan tokala
*/

--Complete replacement string needs to match
select replace(name, 'reddy') from
(select '1eddy govardhan reddy tokala reddy' as name from dual);
/*Output
1eddy govardhan tokala
*/

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
-- trim and suplied string
select trim('reddy' from '1redd govardhan reddy tokala 1eddy')
,trim('reddy' from 'redd1 govardhan reddy tokala 1eddy')
,trim('reddy' from 'redd govardhan reddy tokala eddy')
,trim('reddy' from 'reddy govardhan reddy tokala reddy')
,trim('reddy' from 'reddyy govardhan reddy tokala reddyy')
,trim('reddy' from 'rreddy govardhan reddy tokala rreddy')
,trim('redy' from 'rreddry govardhan reddy tokala rreddyy')
,trim('red' from 'redrose for  govardhan reddy')
,trim('red' from 'rreddry govardhan reddy tokala rreddyy')
,trim('edy' from 'rreddry govardhan reddy tokala rreddyy')

/*output
1redd govardhan reddy tokala 1	
1 govardhan reddy tokala 1	
govardhan reddy tokala	
govardhan reddy tokala	
govardhan reddy tokala	
govardhan reddy tokala	
govardhan reddy tokala
ose for govardhan reddy	
y govardhan reddy tokala rreddyy
rreddry govardhan reddy tokala rr
*/
--Following statement will return null
select trim('red' from '')


