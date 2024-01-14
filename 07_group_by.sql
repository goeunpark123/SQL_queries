-- 07. GROUP BY

SELECT
       category_code
  FROM tbl_menu
 GROUP BY category_code;

SELECT
       category_code
     , COUNT(*)
     , SUM(menu_price)
     , AVG(menu_price)
  FROM tbl_menu
 GROUP BY category_code;
 
SELECT
       category_code
     , COUNT(*)
     , SUM(menu_price)
     , AVG(menu_price)
  FROM tbl_menu
 WHERE category_code IS NOT NULL
 GROUP BY category_code
 ORDER BY 2;
 
SELECT
       ref_category_code
     , COUNT(*)
     , COUNT(ref_category_code)
  FROM tbl_category
 GROUP BY ref_category_code;
 
SELECT
       ref_category_code
     , COUNT(*)
     , COUNT(ref_category_code)
  FROM tbl_category
 WHERE ref_category_code != 1
 GROUP BY ref_category_code;

SELECT
       ref_category_code
     , COUNT(*)
     , COUNT(ref_category_code)
  FROM tbl_category;
-- --------------------------------------------------------

SELECT
       category_code
     , COUNT(*)
     , SUM(menu_price)
     , AVG(menu_price)
  FROM tbl_menu
 WHERE category_code IS NOT NULL
 GROUP BY category_code
 HAVING SUM(menu_price) >= 24000
 ORDER BY 2;
 
SELECT
       category_code
     , COUNT(*)
     , COUNT(category_code)
     , SUM(menu_price)
     , AVG(menu_price)
  FROM tbl_menu
 GROUP BY category_code
 HAVING SUM(menu_price) >= 24000
 ORDER BY 2;
-- --------------------------------------------------------

SELECT
		 menu_price
     , category_code
     , SUM(menu_price)
     , COUNT(menu_code)
  FROM tbl_menu
 GROUP BY  menu_price, category_code
  WITH ROLLUP;
-- --------------------------------------------------------
  
SELECT
       m.category_code
     , c.category_name
     , AVG(menu_price)
  FROM tbl_menu m
  JOIN tbl_category c ON (m.category_code = c.category_code)
 GROUP BY m.category_code, c.category_name;
 
SELECT
       m.category_code
     , c.category_name
     , AVG(menu_price)
  FROM tbl_menu m
  JOIN tbl_category c ON (m.category_code = c.category_code);

-- 그룹화 기준에 해당되는 항목이 많은 경우에는 첫번째 항목만 조회
SELECT
       a.category_names
     , b.menu_name
  FROM tbl_category a
  JOIN tbl_menu b ON (a.category_code = b.category_code)
 GROUP BY a.category_code;