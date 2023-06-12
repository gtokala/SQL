--Topics TRIM, LTRIM, RTRIM, SUBSTR, REPLACE, REGEX_REPLACE
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

-- trim both
SELECT trim(both '%' from '%%ABCDE_') FROM dual;
SELECT trim(both '%' from '%%ABCDE_%') FROM dual;

--replace()
select replace('123abc123xyz123', '123') from dual;

--trim
select trim('123' from '123abc123xyz') from dual;

-trim is case sensitive trim, ltrim and rtrim only works with single char
SELECT TRIM('a' from 'AAAAnaaa'),
       TRIM('A' from 'AAAAnaaa') 
FROM DUAL;
--out put is AAAAn, naaa

-- both same output chars other than alphabets and numbers are replaced with nothing
SELECT  LOWER(REGEXP_REPLACE(ASCIISTR('2019/023'), '[^a-zA-Z0-9]'))
FROM   dual;
SELECT  LOWER(REGEXP_REPLACE('2019/023', '[^a-zA-Z0-9]'))
FROM   dual;
SELECT  REGEXP_REPLACE('A2019/023', '[^a-zA-Z0-9]')
FROM   dual;

SELECT
LTRIM('anaconda', 'an'),
LTRIM('anaconda', 'na')
FROM dual;

with t as (
select '%/?^ABC/123*#@' as s from dual union all
select 'ABC/123*#@' as s from dual union all
select '%/?^ABC/123' as s from dual union all
select '%/?^' as s from dual union all
select 'ABC/123' as s from dual
)
select s
,regexp_replace(s,'^[^[:alnum:]]*(.*?)[^[:alnum:]]*$','\1') as s_10g
,substr(s
        , instr(s, substr(translate(s, 'X%/?^*#@', 'X'), 1, 1))
        , instr(s, substr(translate(s,'X%/?^*#@','X'), -1, 1), -1)
          - instr(s, substr(translate(s,'X%/?^*#@','X'), 1, 1))
          + 1
       ) as s_9i
from t;

/*
S	              S_10G	  S_9I
%/?^ABC/123*#@	ABC/123	ABC/123
ABC/123*#@	    ABC/123	ABC/123
%/?^ABC/123	    ABC/123	ABC/123
%/?^	          -	      -
ABC/123	        ABC/123	ABC/123
*/

select ltrim(rtrim(col1, '/'), '/') from (
SELECT '/abcd/efght/' as col1 FROM dual
)
select trim(both '/' from '/abcd/efgh/') from dual;

/*
Pattern parts:

(                -- start of Group #1
  [^[:alnum:]]   -- any non-alphanumeric character 
  |              -- or 
  ^              -- start of string or start of line 
)                -- end of Group #1
(                -- start of Group #2
  (              -- start of Group #3 
    \d           -- any digit
  )              -- end of Group #3
  *              -- include in previous group zero or more consecutive digits
  some           -- core string to match
  (              -- start of group #4
    \d           -- any digit
  )              -- end of group #4  
  *              -- include in previous group zero or more consecutive digits
)                -- end of Group #2
(                -- start of Group #5
  [^[:alnum:]]   -- any non-alphanumeric character 
  |              -- or
  $              -- end of string or end of line
)   
*/
select regexp_replace(
  source_string,                                       -- source string
  '([^[:alnum:]]|^)((\d)*some(\d)*)([^[:alnum:]]|$)',  -- pattern
  '\1\5',                                              -- leave separators in place
  1,                                                   -- start from beginning
  0,                                                   -- replace all occurences
  'im'                                                 -- case-insensitive and multiline 
)
from (
SELECT 'some text, 123 someone, another text some1' as source_string FROM dual
)









