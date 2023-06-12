-- Create DEPT table which will be the parent table of EMP table.
create table dept(
  deptno number(2,0),
  dname  varchar2(14),
  loc    varchar2(13)
  constraint pk_dept primary key (deptno)
  )
