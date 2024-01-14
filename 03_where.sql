-- 03. WHERE

SELECT
       menu_name
     , menu_price
     , orderable_status
  FROM tbl_menu
 WHERE orderable_status = 'Y';
 
SELECT
       menu_name
     , menu_price
     , orderable_status
  FROM tbl_menu
 WHERE orderable_status != 'Y';
--  WHERE orderable_status <> 'Y';
-- -------------------------------------------------------- 

-- 기타 카테고리에 해당하지 않는 메뉴 조회
SELECT * FROM tbl_category WHERE category_name = '기타';   -- category code = 10
SELECT * FROM tbl_menu WHERE category_code = 10;   
SELECT * FROM tbl_menu WHERE category_code != 10;
-- ---------------------------------------------------------

SELECT * FROM tbl_menu WHERE menu_price < 10000;
SELECT * FROM tbl_menu WHERE menu_price >= 10000;
-- ---------------------------------------------------------

SELECT
       menu_name
     , menu_price
  FROM tbl_menu
 WHERE menu_price >= 10000
   AND menu_price <= 12000;
--     && menu_price <= 12000;

SELECT
       menu_name
     , menu_price
     , category_code
  FROM tbl_menu
 WHERE menu_price > 5000
    OR category_code = 10;
--     || category_code = 10;

SELECT
       menu_code
     , menu_name
     , menu_price
     , category_code
  FROM tbl_menu
 WHERE category_code = 4
    OR menu_price = 9000
	AND menu_code = 16;
-- --------------------------------------------------------

SELECT
       *
  FROM tbl_menu
 WHERE menu_price BETWEEN 5000 AND 9000;
-- -------------------------------------------------------------------

SELECT
       *
  FROM tbl_menu
 WHERE menu_price < 5000
    OR menu_price > 9000;

SELECT
       *
  FROM tbl_menu
 WHERE menu_price NOT BETWEEN 5000 AND 9000;
--  WHERE NOT menu_price BETWEEN 5000 AND 9000;
-- --------------------------------------------------------------------

SELECT
       *
  FROM tbl_menu
 WHERE menu_name LIKE '%밥%';

SELECT
       *
  FROM tbl_menu
 WHERE menu_name NOT LIKE '%국%';
-- -------------------------------------------------------------------- 

SELECT
       *
  FROM tbl_menu
 WHERE menu_name NOT LIKE '%밥%';
--  WHERE NOT menu_name LIKE '%밥%';
-- --------------------------------------------------------------------

SELECT
       *
  FROM tbl_menu
 WHERE category_code=5
    OR category_code=8
    OR category_code=10;

SELECT
       *
  FROM tbl_menu
 WHERE category_code IN (5, 8, 10);
 
SELECT
       *
  FROM tbl_menuss
 WHERE category_code NOT IN (5, 8, 10);
--  WHERE NOT category_code IN (5, 8, 10);
-- --------------------------------------------------------------------

SELECT
       *
  FROM tbl_category
 WHERE ref_category_code IS NULL;
 
SELECT
       *
  FROM tbl_category
 WHERE ref_category_code IS NOT NULL;
