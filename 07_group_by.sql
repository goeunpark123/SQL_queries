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
 -- --------------------------------------------------------
 
CREATE TABLE sales (
    CODE INT auto_increment,
    YEAR VARCHAR(4),
    MONTH VARCHAR(2),
    product VARCHAR(50),
    amount DECIMAL(10, 2),
    PRIMARY KEY(CODE)
);

INSERT
  INTO sales
(
  CODE, YEAR, MONTH
, product, amount
)
VALUES
(
  NULL, '2023', LPAD('1', 2, '0')
, 'Product A', 1000.00
),
(
  NULL, '2023', LPAD('1', 2, '0')
, 'Product B', 1500.00
),
(
  NULL, '2023', LPAD('2', 2, '0')
, 'Product A', 2000.00
),
(
  NULL, '2023', LPAD('2', 2, '0')
, 'Product B', 2500.00
),
(
  NULL, '2023', LPAD('3', 2, '0')
, 'Product A', 1200.00
),
(
  NULL, '2024', LPAD('3', 2, '0')
, 'Product B', 1700.00
);

-- 연, 월, 상품명으로 그룹화한 연, 월 중간 및 전체 수량 합계 조회(ROLL UP)
SELECT
       year
     , month
     , product
     , SUM(amount) AS total_sales  
  FROM sales
 GROUP BY YEAR, MONTH, product
  WITH ROLLUP;