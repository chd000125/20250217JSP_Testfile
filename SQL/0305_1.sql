-- ��� ����� �̸��� �޿� �� �μ���ȣ�� ����ϴµ�,  
-- �μ� ��ȣ�� ����� ������ ���� �޿��� ���ؼ��� ������������ ����

Select ename, sal, empno
from emp
order by deptno, sal desc;

-- �л� ���̺��� �й��� ��20101���� �л��� ����� ���̵� 
-- �ҹ��ڿ� �빮�ڷ� ��ȯ�Ͽ� ���

select * from STUDENT;

select userid, lower(userid), upper(userid)
from student
where studno = 20101;

--- �л� ���̺��� 1�г� �л��� �ֹε�� ��ȣ���� ������ϰ� �¾ ���� �����Ͽ� 
---  �̸�, �ֹι�ȣ, �������, �¾ ���� ����Ͽ���

select name, idnum,substr(idnum, 1, 6) birthdate, substr(idnum, 3, 2) birth_mon
from student
where grade = 1;

---------------------------------------------------------
-------- ���� �Լ� *** ------------------------------------
---------------------------------------------------------
--1) ROUND �Լ�
--   ������ �ڸ� ���Ͽ��� �ݿø��� ��� ���� ��ȯ�ϴ� �Լ�
-- ���� ���̺��� 101�а� ������ �ϱ��� ���(�� �ٹ����� 22��)�Ͽ� �Ҽ��� ù° �ڸ��� 
-- ��° �ڸ����� �ݿø� �� ���� �Ҽ��� ���� ù° �ڸ����� �ݿø��� ���� ����Ͽ���

select * from PROFESSOR;

select name, Round((sal/22), 1), Round((sal/22), 3), Round((sal/22), -1)
from PROFESSOR
where deptno = 101;

-- 2)TRUNC �Լ�
-- ������ �Ҽ��� �ڸ��� ���ϸ� ������ ��� ���� ��ȯ�ϴ� �Լ�

-- ���� ���̺��� 101�а� ������ �ϱ��� ���(�� �ٹ����� 22��)�Ͽ�
-- �Ҽ��� ù° �ڸ��� ��° �ڸ����� ���� �� ���� 
-- �Ҽ��� ���� ù° �ڸ����� ������ ���� ���

select name, TRUNC(sal/22,1), TRUNC(sal/22,3), TRUNC(sal/22,-1)
from professor
where deptno = 101;

---------------------------------------------------------
-------- ���� �Լ� *** ------------------------------------
---------------------------------------------------------
-- 1) ��¥ + ���� = ��¥ (��¥�� �ϼ��� ����)
-- ���� ��ȣ�� 9908�� ������ �Ի����� �������� �Ի� 30�� �Ŀ� 60�� ���� ��¥�� ���

select name, hiredate, hiredate+30, hiredate+60
from professor
where profno = 9908;

-- 5) MONTHS_BETWEEN : date1�� date2 ������ ���� ���� ���
--     ADD_MONTHS        : date�� ���� ���� ���� ��¥ ���
--     MONTHS_BETWEEN�� ADD_MONTHS �Լ��� �� ������ ��¥ ������ �ϴ� �Լ� 
--     �Ի����� 120���� �̸��� ������ ������ȣ, �Ի���, �Ի��Ϸ� ���� �����ϱ����� ���� ��,
--     �Ի��Ͽ��� 6���� ���� ��¥�� ����Ͽ���

select name, profno, hiredate,
        MONTHS_BETWEEN(SYSDATE,hiredate) working_day,
        ADD_MONTHS(hiredate, 6) hire_6after
from professor
where MONTHS_Between(sysdate, hiredate) < 120;

------------------------------------------------------------------------
---    PL/SQL�� ����
---   1. Oracle���� �����ϴ� ���α׷��� ����� Ư���� ������ SQL�� Ȯ��
---   2. PL/SQL Block������ SQL�� DML(������ ���۾�)���� Query(�˻���)��, 
---      �׸��� ������ ���(IF, LOOP) ���� ����Ͽ� ���������� ���α׷����� �����ϰ� 
---      �� ������  Ʈ����� ���
---
---   1) ���� 
---      ���α׷� ������ ���ȭ : ������ ���α׷��� �ǹ��ְ� �� ���ǵ� ���� Block ����
---      ��������  : ���̺�� Į���� ������ Ÿ���� ������� �ϴ� �������� ������ ����
---      ����ó��  : Exception ó�� ��ƾ�� ����Ͽ� Oracle ���� ������ ó��
---      �̽ļ�    : Oracle�� PL/SQL�� �����ϴ¾ ȣ��Ʈ�ε� ���α׷� �̵� ����
---      ���� ��� : ���� ���α׷��� ������ ���
 
------------------------------------------------------------------------

--��1) Ư���� ���� ������ 7%�� ����ϴ� Function�� �ۼ�
-- ���� 1 : Function --> tax
-- ���� 2 : parameter --> p_num (�޿�)
-- ���� 3: ����� ���� 7% ���� ������

CREATE OR Replace FUNCTION tax(p_num in number)
RETURN number
IS
    v_tax number;
begin
    --7% ���
    v_tax := p_num * 0.07;
    RETURN(v_tax);
END;

select tax(100) from dual;
select tax(500) from dual;

select empno, ename, sal, tax(sal)
from emp;

------------------------------------------------------------
--  EMP ���̺��� ����� �Է¹޾� �ش� ����� �޿��� ���� ������ ����.
-- �޿��� 2000 �̸��̸� �޿��� 6%, 
-- �޿��� 3000 �̸��̸� 8%, 
-- 5000 �̸��̸� 10%, 
-- �� �̻��� 15%�� ����
--- FUNCTION  emp_tax3
-- 1) Parameter : ��� p_empno
--      ����     :   v_sal(�޿�)
--                     v_pct(����)
-- 2) ����� ������ �޿��� ����
-- 3) �޿��� ������ ���� ��� 
-- 4) ��� �� �� Return   number
-------------------------------------------------------------
CREATE or Replace Function emp_tax3
( p_empno       IN      emp.empno%TYPE ) -- 1) parameter : ���
RETURN      number
IS
    v_sal   emp.sal%TYPE;
    v_pct   NUMBER(5,2);
BEGIN
    SELECT      sal
    INTO        v_sal
    FROM        emp
    WHERE       empno = p_empno;


If      v_sal   <   2000    Then
        v_pct := (v_sal*0.06);
ELSIF   v_sal   <   3000    Then
        v_pct := (v_sal * 0.08);
ELSIF   v_sal   <   5000    Then
        v_pct := (v_sal * 0.10);
ELSE    v_pct := (v_sal * 0.15);
END IF;
RETURN(v_pct);
END emp_tax3;

select ename, sal, emp_tax3(empno)
from emp;

---------------------------------------------------------
-- �ൿ���� : �μ���ȣ �Է� �ش� emp ����  PROCEDURE 
-- SQL> EXECUTE DeptEmpSearch1(empno);
--  ��ȸȭ�� :    ���    : 5555
--              �̸�    : ȫ�浿

CREATE or Replace PROCEDURE EmpSearch1
( p_ename in emp.empno%type )
IS
    v_job       emp.job%type;
    v_ename     emp.ename%type;
Begin
    DBMS_OUTPUT.ENABLE;
    SELECT  job,    ename
    INTO    v_job,  v_ename
    From    emp
    WHERE   empno = p_empno;
    DBMS_OUTPUT_LINE('��� : ' || p_empno);
    DBMS_OUTPUT_LINE('�̸� : ' || v_ename);
    DBMS_OUTPUT_LINE('���� : ' || v_job);
END EmpSearch1;

-----------------------------------------------------
--  Procedure up_emp ���� ���
-- SQL> EXECUTE up_emp(1200);  -- ��� 
-- ���       : �޿� �λ� ����
--               ���۹���
--   ����     :   v_job(����)
--                  v_pct(����)

-- ���� 1) job = SALE����         v_pct : 10
--           IF              v_job LIKE 'SALE%' THEN
--     2)   MAN              v_pct : 7  
--     3)                    v_pct : 5
--   job�� ���� �޿� �λ��� ����  sal = sal+sal*v_pct/100
-- Ȯ�� : DB -> TBL
-----------------------------------------------------

select * from emp;

CREATE or Replace PROCEDURE Up_Emp
( p_empno       IN      emp.empno%type )
IS
   v_job       emp.job%type;
   v_pct       number(3);
BEGIN
    SELECT      JOB
    INTO        v_job
    FROM        emp
    WHERE       empno = p_empno;

-- ����
IF          v_job LIKE 'SALE%' THEN
             v_pct := 10;
ELSIF       v_job LIKE 'MAN%' THEN
             v_pct := 7;
ELSE
             v_pct := 5;
END IF; 
UPDATE      emp
SET         sal = sal+sal*v_pct/100
WHERE       empno   =   p_empno;
END Up_Emp;

select * from emp;

----------------------------------------------------------
-- PROCEDURE Delete_emp
-- SQL> EXECUTE Delete_emp(9001);
-- �����ȣ : 9001
-- ����̸� : 55
-- �� �� �� : 81/12/03
-- ������ ���� ����
--  1. Parameter : ��� �Է�
--  2. ��� �̿��� �����ȣ ,����̸� , �� �� �� ���
--  3. ��� �ش��ϴ� ������ ���� 
----------------------------------------------------------

CREATE or REPLACE PROCEDURE Delete_emp
( p_empno   IN  emp.empno%TYPE )
IS
    v_empno     emp.empno%TYPE;
    v_ename     emp.ename%TYPE;
    v_hiredate  emp.hiredate%TYPE;
BEGIN
    DBMS_OUTPUT.ENABLE;
    SELECT      empno,  ename, hiredate
    INTO        v_empno, v_ename, v_hiredate
    FROM        emp
    WHERE       empno   =   p_empno;
    DBMS_OUTPUT.PUT_LINE('�����ȣ : ' || v_empno);
    DBMS_OUTPUT.PUT_LINE('����̸� : ' || v_ename);
    DBMS_OUTPUT.PUT_LINE('�Ի��� : ' || v_hiredate);

DELETE emp
WHERE empno = p_empno;

END Delete_emp;

---------------------------------------------------------
-- �ൿ���� : �μ���ȣ �Է� �ش� emp ����  PROCEDURE 
-- SQL> EXECUTE DeptEmpSearch1(empno);
--  ��ȸȭ�� :    ���    : 5555
--              �̸�    : ȫ�浿

CREATE OR REPLACE PROCEDURE DeptEmpSearch1
( p_deptno  IN  dept.deptno%TYPE )
IS
    v_empno     emp.empno%TYPE;
    v_ename     emp.ename%TYPE;
BEGIN
    DBMS_OUTPUT.ENABLE;
    SELECT      empno, ename
    INTO        v_empno, v_ename
    FROM        emp
    WHERE       deptno  =   p_deptno;
    DBMS_OUTPUT.PUT_LINE('��� : ' || v_empno);
    DBMS_OUTPUT.PUT_LINE('�̸� : ' || v_ename);
END DeptEmpSearch1;

----------------------------------------------------------------
-- %ROWTYPE ����
--���� �������� ��� ���̺� ��ü�� ������ ���� ( �迭�� ������ �����ϴ°Ŷ� ����� ������ ��? )

CREATE OR REPLACE PROCEDURE DeptEmpSearch1
---------------------------------------------------------
-- �ൿ���� : �μ���ȣ �Է� �ش� emp ����  PROCEDURE 
-- SQL> EXECUTE DeptEmpSearch1(empno);
--  ��ȸȭ�� :    ���    : 5555
--              �̸�    : ȫ�浿

-- %ROWTYPE ����
--���� �������� ��� ���̺� ��ü�� ������ ���� ( �迭�� ������ �����ϴ°Ŷ� ����� ������ ��? )
( p_deptno  IN  dept.deptno%TYPE )
IS
     v_emp   emp%ROWTYPE;
--    v_empno     emp.empno%TYPE;
--    v_ename     emp.ename%TYPE;

BEGIN
    DBMS_OUTPUT.ENABLE;
    SELECT      *
    INTO        v_emp
    FROM        emp
    WHERE       deptno  =   p_deptno;
    
    DBMS_OUTPUT.PUT_LINE('��� : ' || v_emp.empno);
    DBMS_OUTPUT.PUT_LINE('�̸� : ' || v_emp.ename);
    
    -- Multi Row Error --> ���� ������ �䱸�� �ͺ��� ���� ���� ���� ����
    EXCEPTION
    WHEN OTHERS THEN    
    DBMS_OUTPUT.PUT_LINE('ERR CODE 1 : ' || TO_CHAR(SQLCODE));
    DBMS_OUTPUT.PUT_LINE('ERR CODE 2 : ' || SQLCODE);
    DBMS_OUTPUT.PUT_LINE('ERR CODE 3 : ' || SQLERM);
    
END DeptEmpSearch1;

-- Multi Row Error --> ���� ������ �䱸�� �ͺ��� ���� ���� ���� ����

--------------------------------------------------------------------------------
----  ***    cursor    ***
--- 1.���� : Oracle Server�� SQL���� �����ϰ� ó���� ������ �����ϱ� ���� 
--        "Private SQL Area" �̶�� �ϴ� �۾������� �̿�
--       �� ������ �̸��� �ο��ϰ� ����� ������ ó���� �� �ְ� ���ִµ� �̸� CURSOR
-- 2. ����  :    Implicit(��������) CURSOR -> DML���� SELECT���� ���� ���������� ���� 
--                 Explicit(�������) CURSOR -> ����ڰ� �����ϰ� �̸��� �����ؼ� ��� 
-- 3.attribute
--   1) SQL%ROWCOUNT : ���� �ֱ��� SQL���� ���� ó���� Row ��
--   2) SQL%FOUND    : ���� �ֱ��� SQL���� ���� ó���� Row�� ������ �� ���̻��̸� True
--   3) SQL%NOTFOUND : ���� �ֱ��� SQL���� ���� ó���� Row�� ������ ������True
-- 4. 4�ܰ� ** 
--     1) DECLARE �ܰ� : Ŀ���� �̸��� �ο��ϰ� Ŀ�������� ������ SELECT���� ���������ν� CURSOR�� ����
--     2) OPEN �ܰ� : OPEN���� �����Ǵ� ������ �����ϰ�, SELECT���� ����
--     3) FETCH �ܰ� : CURSOR�κ��� Pointer�� �����ϴ� Record�� ���� ������ ����
--     4) CLOSE �ܰ� : Record�� Active Set�� �ݾ� �ְ�, �ٽ� ���ο� Active Set������� OPEN�� �� �ְ� ����
--------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE show_emp3
( p_empno    IN  emp.empno%TYPE )
IS
    -- 1. DECLARE �ܰ�
    CURSOR emp_cursor IS
    SELECT ename, job, sal
    FROM emp
    WHERE empno LIKE p_empno||'%';
    
    v_ename     emp.ename%TYPE;
    v_sal       emp.sal%TYPE;
    v_job       emp.job%TYPE;
BEGIN
    -- 2. OPEN �ܰ�
    OPEN emp_cursor;
    DBMS_OUTPUT.PUT_LINE('�̸�  '||'����'||'�޿�');
    DBMS_OUTPUT.PUT_LINE('--------------------');
    LOOP
        -- 3. FETCH �ܰ� -> �ϳ��� ����
        FETCH emp_cursor INTO v_ename, v_job, v_sal;
        EXIT WHEN emp_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_ename||'   '||v_job||'   '||v_sal);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(emp_cursor%ROWCOUNT||'���� �� ����.');
    -- 4. CLOSE �ܰ�
    CLOSE emp_cursor;
END show_emp3;

-----------------------------------------------------
-- Fetch ��    ***
-- SQL> EXECUTE  Cur_sal_Hap (5);
-- CURSOR �� �̿� ���� 
-- �μ���ŭ �ݺ� 
-- 	�μ��� : �λ���
-- 	�ο��� : 5
-- 	�޿��� : 5000
--  
-----------------------------------------------------
CREATE OR REPLACE PROCEDURE Cur_sal_hap
(   p_deptno    IN      emp.deptno%TYPE )
IS
    CURSOR dept_sum IS
        SELECT      dname, COUNT(*) cnt, SUM(sal) sumSal
        FROM        emp e, dept d
        WHERE       e.deptno = d.deptno
        and         e.deptno LIKE p_deptno||'%'
        GROUP BY    dname;
        
        
        vdname      dept.dname%TYPE;
        vcnt        number;
        vsumSal     number;
Begin
    DBMS_OUTPUT.ENABLE;
    
    OPEN    dept_sum;
    LOOP
        FETCH           dept_sum    INTO    vdname, vcnt, vsumSal;
        EXIT    WHEN    dept_sum%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('�μ��� : '||vdname);
        DBMS_OUTPUT.PUT_LINE('�ο��� : '||vdname);
        DBMS_OUTPUT.PUT_LINE('�޿� �� : '||vdname);
    END LOOP;
    
    CLOSE dept_sum;
END Cur_sal_hap;
-- IN ���� �ȿ��� �� ��. OUT : �ۿ��� �� ��.
CREATE OR REPLACE PROCEDURE Emp_Info3
(p_empno    IN  emp.empno%TYPE,  p_sal  OUT   emp.sal%TYPE)
IS
    v_empno     emp.empno%TYPE;
    v_ename     emp.ename%TYPE;
BEGIN

    DBMS_OUTPUT.ENABLE;
    SELECT      empno, ename, sal
    INTO        v_empno, v_ename, p_sal
    FROM        emp
    WHERE       empno = p_empno;
    
    DBMS_OUTPUT.PUT_LINE('�����ȣ : ' || v_empno);
    DBMS_OUTPUT.PUT_LINE('����̸� : ' || v_ename);
    DBMS_OUTPUT.PUT_LINE('����޿� : ' || p_sal);
END;

select e.empno, e.ename, e.sal, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno;

---- <<<   FULL OUTER JOIN  >>> -------------------------------
--�л� ���̺�� ���� ���̺��� �����Ͽ� �̸�, �г�, �������� �̸�, ������ ���
-- ��, �����л��� �������� ���� ���� �̸� �� 
--  ���������� �������� ���� �л��̸�  �Բ� ����Ͽ���
--  Oracle ���� �� �� 
SELECT s.name , s.grade , p.name , p.position
FROM   student s , professor p
WHERE  s.profno(+) = p.profno(+)
ORDER BY p.profno;

---------------------------------------------------------------------------
-- OUTER JOIN  ***
-- EQUI JOIN���� ���� Į�� ������ �ϳ��� NULL ������ ���� ����� ����� �ʿ䰡 �ִ� ���
-- OUTER JOIN ���
SELECT s.name , s.grade , p.name , p.position
FROM    student s , professor p
WHERE  s.profno = p.profno ;

-- �л� ���̺�� ���� ���̺��� �����Ͽ� �̸�, �г�, ���������� �̸�, ������ ���
-- ��, ���������� �������� ���� �л��̸��� �Բ� ����Ͽ���.
-- Left Outer Join
SELECT s.name , s.grade , p.name , p.position
FROM    student s , professor p
WHERE  s.profno = p.profno (+);

--- ANSI OUTER JOIN
-- 1. ANSI LEFT OUTER JOIN
SELECT s.studno, s.name, s.profno, p.name
FROM   student s
       LEFT OUTER JOIN professor p
       ON  s.profno = p.profno; 
       
--�л� ���̺�� ���� ���̺��� �����Ͽ� �̸�, �г�, �������� �̸�, ������ ���
-- ��, �����л��� �������� ���� ���� �̸��� �Բ� ����Ͽ���
SELECT s.name , s.grade , p.name , p.position
FROM   student s , professor p
WHERE  s.profno(+) = p.profno
ORDER BY p.profno;





