-- 08. SUBQUERY

SELECT
       *
  FROM employee
 WHERE dept_code = (SELECT dept_code
                      FROM employee
							WHERE emp_name = '유재식');

SELECT
       *
  FROM employee
 WHERE dept_code = (SELECT dept_code
                      FROM employee
							WHERE emp_name = '유재식')
	AND emp_id != (SELECT emp_id
                    FROM employee
                   WHERE emp_name = '유재식');
-- --------------------------------------------------------

SELECT
       a.menu_code
     , a.menu_name
     , a.menu_price
     , a.category_code
  FROM tbl_menu a
 WHERE a.menu_price > (SELECT AVG(b.menu_price)
 								 FROM tbl_menu b
 								WHERE b.category_code = a.category_code);
 								
SELECT
       *
  FROM tbl_menu a
 WHERE a.menu_price IN (SELECT AVG(b.menu_price)
  							    FROM tbl_menu b
  							   GROUP BY b.category_code);
-- --------------------------------------------------------

SELECT
       category_code
     , category_name
  FROM tbl_category a
 WHERE EXISTS(SELECT 1
                FROM tbl_menu b
               WHERE b.category_code = a.category_code)
 ORDER BY 1;
-- ---------------------------------------------------------

-- 1. 가장 높은 급여를 받는 사원 조회

SELECT
       MAX(salary)
  FROM employee;

SELECT
       *
  FROM employee
 WHERE salary = (SELECT MAX(salary)
                   FROM employee);
                                   

-- 2. 평균 급여가 가장 높은 부서 조회

SELECT
       AVG(salary)
  FROM employee
 GROUP BY dept_code;
 
SELECT
       MAX(a.sal_avg)
  FROM (SELECT AVG(salary) sal_avg
          FROM employee
         GROUP BY dept_code) a;

SELECT
       a.dept_code
     , b.dept_title
  FROM employee a
  JOIN department b ON (b.dept_id = a.dept_code)
 GROUP BY a.dept_code
HAVING AVG(a.salary) = (SELECT max(c.sal_avg)
                        FROM (SELECT AVG(salary) sal_avg
                                FROM employee
                               GROUP BY dept_code) c);
-- ---------------------------------------------------------
                               
SELECT
       dept_code
  FROM employee
 GROUP BY dept_code
HAVING AVG(salary) >= ALL (SELECT AVG(salary)
                             FROM employee
                            GROUP BY dept_code);      