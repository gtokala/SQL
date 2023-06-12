select * from emp;
select empno, lpad(empno,8,0), nvl(comm,0) from emp;
select trim(' gova  '), length(trim(' gova  ')) from dual;
select trim(trailing 'a' from ' gova') from dual;

SELECT
  TRIM( LEADING ' ' FROM  ' ABC ' )
FROM
  dual;

-- here in oracle TRIM, LTRIM and RTRIM only works with single Char not string trim
-- when you have space infront of the string and you mentioned letter trim is not going to work.
select trim(leading 'g' from ' gova'), length(trim(leading 'g' from ' gova')) from dual;

-- This will trim g form gova, LTRIM and RTIRM also similar to this.
select trim(leading 'g' from 'gova'), length(trim(leading 'g' from 'gova')) from dual;

-- trailing trim
select trim(trailing 'a' from ' gova'), length(trim(trailing 'a' from 'gova')) from dual;

--LTRIM and RTRIM
select ltrim('a' from ' gova'), length(ltrim('a' from 'gova')) from dual;
select rtrim( 'a' from ' gova'), length(rtrim('a' from 'gova')) from dual;

--another example oracle is throwing error for this but SQL Server is working
--here instead we have to replace() function in Oracle and substr()
select trim(leading 'STR' from 'STRmydataSTR') from dual;
select trim('STR' from 'STRmydataSTR') from dual;

-- here replace() with 2 parameters replaces STR with nothing
-- With 3rd option replaces with specified string
select replace('STRmydataSTR', 'STR') from dual;
select replace('STRmydataSTR', 'STR', 'String') from dual;

--Substr() only works STR is always at the beggining/ending and you want to do either lefttrim/right trim
--Here if you only provide 2 input parameter like below for sustr() example it gives the remaining string 
--starting at 4th position (index stats from 1)
select substr('STRmydataSTR', 4) from dual;

-- 3 parameter substr()
select substr('STRmydataSTR', 4, 6) from dual;

--Oracle regex_replace example
-- this remove all chars exept upper/lower case alphabets
select REGEXP_REPLACE('some text, 123 someone, another text some1','[^a-zA-Z]','')
from dual;

-- following example omits ' ' space 
select REGEXP_REPLACE('some text, 123 someone, another text some1','[^a-zA-Z ]','')
from dual;







