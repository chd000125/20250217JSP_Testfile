-- 모든 사원의 이름과 급여 및 부서번호를 출력하는데,  
-- 부서 번호로 결과를 정렬한 다음 급여에 대해서는 내림차순으로 정렬

Select ename, sal, empno
from emp
order by deptno, sal desc;

-- 학생 테이블에서 학번이 ‘20101’인 학생의 사용자 아이디를 
-- 소문자와 대문자로 변환하여 출력

select * from STUDENT;

select userid, lower(userid), upper(userid)
from student
where studno = 20101;

--- 학생 테이블에서 1학년 학생의 주민등록 번호에서 생년월일과 태어난 달을 추출하여 
---  이름, 주민번호, 생년월일, 태어난 달을 출력하여라

select name, idnum,substr(idnum, 1, 6) birthdate, substr(idnum, 3, 2) birth_mon
from student
where grade = 1;

---------------------------------------------------------
-------- 숫자 함수 *** ------------------------------------
---------------------------------------------------------
--1) ROUND 함수
--   지정한 자리 이하에서 반올림한 결과 값을 반환하는 함수
-- 교수 테이블에서 101학과 교수의 일급을 계산(월 근무일은 22일)하여 소수점 첫째 자리와 
-- 셋째 자리에서 반올림 한 값과 소숫점 왼쪽 첫째 자리에서 반올림한 값을 출력하여라

select * from PROFESSOR;

select name, Round((sal/22), 1), Round((sal/22), 3), Round((sal/22), -1)
from PROFESSOR
where deptno = 101;

-- 2)TRUNC 함수
-- 지정한 소수점 자리수 이하를 절삭한 결과 값을 반환하는 함수

-- 교수 테이블에서 101학과 교수의 일급을 계산(월 근무일은 22일)하여
-- 소수점 첫째 자리와 셋째 자리에서 절삭 한 값과 
-- 소숫점 왼쪽 첫째 자리에서 절삭한 값을 출력

select name, TRUNC(sal/22,1), TRUNC(sal/22,3), TRUNC(sal/22,-1)
from professor
where deptno = 101;

---------------------------------------------------------
-------- 날자 함수 *** ------------------------------------
---------------------------------------------------------
-- 1) 날짜 + 숫자 = 날짜 (날짜에 일수를 가산)
-- 교수 번호가 9908인 교수의 입사일을 기준으로 입사 30일 후와 60일 후의 날짜를 출력

select name, hiredate, hiredate+30, hiredate+60
from professor
where profno = 9908;

-- 5) MONTHS_BETWEEN : date1과 date2 사이의 개월 수를 계산
--     ADD_MONTHS        : date에 개월 수를 더한 날짜 계산
--     MONTHS_BETWEEN과 ADD_MONTHS 함수는 월 단위로 날짜 연산을 하는 함수 
--     입사한지 120개월 미만인 교수의 교수번호, 입사일, 입사일로 부터 현재일까지의 개월 수,
--     입사일에서 6개월 후의 날짜를 출력하여라

select name, profno, hiredate,
        MONTHS_BETWEEN(SYSDATE,hiredate) working_day,
        ADD_MONTHS(hiredate, 6) hire_6after
from professor
where MONTHS_Between(sysdate, hiredate) < 120;

------------------------------------------------------------------------
---    PL/SQL의 개념
---   1. Oracle에서 지원하는 프로그래밍 언어의 특성을 수용한 SQL의 확장
---   2. PL/SQL Block내에서 SQL의 DML(데이터 조작어)문과 Query(검색어)문, 
---      그리고 절차형 언어(IF, LOOP) 등을 사용하여 절차적으로 프로그래밍을 가능하게 
---      한 강력한  트랜잭션 언어
---
---   1) 장점 
---      프로그램 개발의 모듈화 : 복잡한 프로그램을 의미있고 잘 정의된 작은 Block 분해
---      변수선언  : 테이블과 칼럼의 데이터 타입을 기반으로 하는 유동적인 변수를 선언
---      에러처리  : Exception 처리 루틴을 사용하여 Oracle 서버 에러를 처리
---      이식성    : Oracle과 PL/SQL을 지원하는어떤 호스트로도 프로그램 이동 가능
---      성능 향상 : 응용 프로그램의 성능을 향상
 
------------------------------------------------------------------------

--문1) 특정한 수에 세금을 7%로 계산하는 Function을 작성
-- 조건 1 : Function --> tax
-- 조건 2 : parameter --> p_num (급여)
-- 조건 3: 계산을 통해 7% 값을 돌려줌

CREATE OR Replace FUNCTION tax(p_num in number)
RETURN number
IS
    v_tax number;
begin
    --7% 계산
    v_tax := p_num * 0.07;
    RETURN(v_tax);
END;

select tax(100) from dual;
select tax(500) from dual;

select empno, ename, sal, tax(sal)
from emp;

------------------------------------------------------------
--  EMP 테이블에서 사번을 입력받아 해당 사원의 급여에 따른 세금을 구함.
-- 급여가 2000 미만이면 급여의 6%, 
-- 급여가 3000 미만이면 8%, 
-- 5000 미만이면 10%, 
-- 그 이상은 15%로 세금
--- FUNCTION  emp_tax3
-- 1) Parameter : 사번 p_empno
--      변수     :   v_sal(급여)
--                     v_pct(세율)
-- 2) 사번을 가지고 급여를 구함
-- 3) 급여를 가지고 세율 계산 
-- 4) 계산 된 값 Return   number
-------------------------------------------------------------
CREATE or Replace Function emp_tax3
( p_empno       IN      emp.empno%TYPE ) -- 1) parameter : 사번
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
-- 행동강령 : 부서번호 입력 해당 emp 정보  PROCEDURE 
-- SQL> EXECUTE DeptEmpSearch1(empno);
--  조회화면 :    사번    : 5555
--              이름    : 홍길동

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
    DBMS_OUTPUT_LINE('사번 : ' || p_empno);
    DBMS_OUTPUT_LINE('이름 : ' || v_ename);
    DBMS_OUTPUT_LINE('업무 : ' || v_job);
END EmpSearch1;

-----------------------------------------------------
--  Procedure up_emp 실행 결과
-- SQL> EXECUTE up_emp(1200);  -- 사번 
-- 결과       : 급여 인상 저장
--               시작문자
--   변수     :   v_job(업무)
--                  v_pct(세율)

-- 조건 1) job = SALE포함         v_pct : 10
--           IF              v_job LIKE 'SALE%' THEN
--     2)   MAN              v_pct : 7  
--     3)                    v_pct : 5
--   job에 따른 급여 인상을 수행  sal = sal+sal*v_pct/100
-- 확인 : DB -> TBL
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

-- 조건
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
-- 사원번호 : 9001
-- 사원이름 : 55
-- 입 사 일 : 81/12/03
-- 데이터 삭제 성공
--  1. Parameter : 사번 입력
--  2. 사번 이용해 사원번호 ,사원이름 , 입 사 일 출력
--  3. 사번 해당하는 데이터 삭제 
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
    DBMS_OUTPUT.PUT_LINE('사원번호 : ' || v_empno);
    DBMS_OUTPUT.PUT_LINE('사원이름 : ' || v_ename);
    DBMS_OUTPUT.PUT_LINE('입사일 : ' || v_hiredate);

DELETE emp
WHERE empno = p_empno;

END Delete_emp;

---------------------------------------------------------
-- 행동강령 : 부서번호 입력 해당 emp 정보  PROCEDURE 
-- SQL> EXECUTE DeptEmpSearch1(empno);
--  조회화면 :    사번    : 5555
--              이름    : 홍길동

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
    DBMS_OUTPUT.PUT_LINE('사번 : ' || v_empno);
    DBMS_OUTPUT.PUT_LINE('이름 : ' || v_ename);
END DeptEmpSearch1;

----------------------------------------------------------------
-- %ROWTYPE 사용법
--값이 여러개일 경우 테이블 자체를 변수로 지정 ( 배열을 변수로 선언하는거랑 비슷한 개념인 듯? )

CREATE OR REPLACE PROCEDURE DeptEmpSearch1
---------------------------------------------------------
-- 행동강령 : 부서번호 입력 해당 emp 정보  PROCEDURE 
-- SQL> EXECUTE DeptEmpSearch1(empno);
--  조회화면 :    사번    : 5555
--              이름    : 홍길동

-- %ROWTYPE 사용법
--값이 여러개일 경우 테이블 자체를 변수로 지정 ( 배열을 변수로 선언하는거랑 비슷한 개념인 듯? )
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
    
    DBMS_OUTPUT.PUT_LINE('사번 : ' || v_emp.empno);
    DBMS_OUTPUT.PUT_LINE('이름 : ' || v_emp.ename);
    
    -- Multi Row Error --> 실제 인출은 요구된 것보다 많은 수의 행을 추출
    EXCEPTION
    WHEN OTHERS THEN    
    DBMS_OUTPUT.PUT_LINE('ERR CODE 1 : ' || TO_CHAR(SQLCODE));
    DBMS_OUTPUT.PUT_LINE('ERR CODE 2 : ' || SQLCODE);
    DBMS_OUTPUT.PUT_LINE('ERR CODE 3 : ' || SQLERM);
    
END DeptEmpSearch1;

-- Multi Row Error --> 실제 인출은 요구된 것보다 많은 수의 행을 추출

--------------------------------------------------------------------------------
----  ***    cursor    ***
--- 1.정의 : Oracle Server는 SQL문을 실행하고 처리한 정보를 저장하기 위해 
--        "Private SQL Area" 이라고 하는 작업영역을 이용
--       이 영역에 이름을 부여하고 저장된 정보를 처리할 수 있게 해주는데 이를 CURSOR
-- 2. 종류  :    Implicit(묵시적인) CURSOR -> DML문과 SELECT문에 의해 내부적으로 선언 
--                 Explicit(명시적인) CURSOR -> 사용자가 선언하고 이름을 정의해서 사용 
-- 3.attribute
--   1) SQL%ROWCOUNT : 가장 최근의 SQL문에 의해 처리된 Row 수
--   2) SQL%FOUND    : 가장 최근의 SQL문에 의해 처리된 Row의 개수가 한 개이상이면 True
--   3) SQL%NOTFOUND : 가장 최근의 SQL문에 의해 처리된 Row의 개수가 없으면True
-- 4. 4단계 ** 
--     1) DECLARE 단계 : 커서에 이름을 부여하고 커서내에서 수행할 SELECT문을 정의함으로써 CURSOR를 선언
--     2) OPEN 단계 : OPEN문은 참조되는 변수를 연결하고, SELECT문을 실행
--     3) FETCH 단계 : CURSOR로부터 Pointer가 존재하는 Record의 값을 변수에 전달
--     4) CLOSE 단계 : Record의 Active Set을 닫아 주고, 다시 새로운 Active Set을만들어 OPEN할 수 있게 해줌
--------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE show_emp3
( p_empno    IN  emp.empno%TYPE )
IS
    -- 1. DECLARE 단계
    CURSOR emp_cursor IS
    SELECT ename, job, sal
    FROM emp
    WHERE empno LIKE p_empno||'%';
    
    v_ename     emp.ename%TYPE;
    v_sal       emp.sal%TYPE;
    v_job       emp.job%TYPE;
BEGIN
    -- 2. OPEN 단계
    OPEN emp_cursor;
    DBMS_OUTPUT.PUT_LINE('이름  '||'업무'||'급여');
    DBMS_OUTPUT.PUT_LINE('--------------------');
    LOOP
        -- 3. FETCH 단계 -> 하나씩 꺼냄
        FETCH emp_cursor INTO v_ename, v_job, v_sal;
        EXIT WHEN emp_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_ename||'   '||v_job||'   '||v_sal);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(emp_cursor%ROWCOUNT||'개의 행 선택.');
    -- 4. CLOSE 단계
    CLOSE emp_cursor;
END show_emp3;

-----------------------------------------------------
-- Fetch 문    ***
-- SQL> EXECUTE  Cur_sal_Hap (5);
-- CURSOR 문 이용 구현 
-- 부서만큼 반복 
-- 	부서명 : 인사팀
-- 	인원수 : 5
-- 	급여합 : 5000
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
        DBMS_OUTPUT.PUT_LINE('부서명 : '||vdname);
        DBMS_OUTPUT.PUT_LINE('인원수 : '||vdname);
        DBMS_OUTPUT.PUT_LINE('급여 합 : '||vdname);
    END LOOP;
    
    CLOSE dept_sum;
END Cur_sal_hap;
-- IN 내가 안에서 쓸 값. OUT : 밖에서 쓸 값.
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
    
    DBMS_OUTPUT.PUT_LINE('사원번호 : ' || v_empno);
    DBMS_OUTPUT.PUT_LINE('사원이름 : ' || v_ename);
    DBMS_OUTPUT.PUT_LINE('사원급여 : ' || p_sal);
END;

select e.empno, e.ename, e.sal, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno;

---- <<<   FULL OUTER JOIN  >>> -------------------------------
--학생 테이블과 교수 테이블을 조인하여 이름, 학년, 지도교수 이름, 직급을 출력
-- 단, 지도학생을 배정받지 않은 교수 이름 및 
--  지도교수가 배정되지 않은 학생이름  함께 출력하여라
--  Oracle 지원 안 함 
SELECT s.name , s.grade , p.name , p.position
FROM   student s , professor p
WHERE  s.profno(+) = p.profno(+)
ORDER BY p.profno;

---------------------------------------------------------------------------
-- OUTER JOIN  ***
-- EQUI JOIN에서 양측 칼럼 값중의 하나가 NULL 이지만 조인 결과로 출력할 필요가 있는 경우
-- OUTER JOIN 사용
SELECT s.name , s.grade , p.name , p.position
FROM    student s , professor p
WHERE  s.profno = p.profno ;

-- 학생 테이블과 교수 테이블을 조인하여 이름, 학년, 지도교수의 이름, 직급을 출력
-- 단, 지도교수가 배정되지 않은 학생이름도 함께 출력하여라.
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
       
--학생 테이블과 교수 테이블을 조인하여 이름, 학년, 지도교수 이름, 직급을 출력
-- 단, 지도학생을 배정받지 않은 교수 이름도 함께 출력하여라
SELECT s.name , s.grade , p.name , p.position
FROM   student s , professor p
WHERE  s.profno(+) = p.profno
ORDER BY p.profno;





