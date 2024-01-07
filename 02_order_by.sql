-- 02. ORDER BY

-- 오름차순
SELECT
       menu_code
	  , menu_name
	  , menu_price
  FROM tbl_menu
 ORDER BY menu_price;

SELECT
       menu_code
	  , menu_name
	  , menu_price
  FROM tbl_menu
 ORDER BY menu_price ASC;

-- 내림차순
SELECT
       menu_code
	  , menu_name
	  , menu_price
  FROM tbl_menu
 ORDER BY menu_price DESC;
-- --------------------------------------------------------
 
SELECT
       menu_name
	  , menu_price
  FROM tbl_menu
 ORDER BY 2 DESC;
 
SELECT
       menu_name AS 'menu'
	  , menu_price AS 'price'
  FROM tbl_menu
 ORDER BY menu;   -- 변수명에는 '을 붙이지 X
-- --------------------------------------------------------
 
SELECT
       menu_name AS 'menu'
	  , menu_price AS 'price'
  FROM tbl_menu
 ORDER BY 1 DESC, 2 ASC;   -- 첫번째 조건이 일치하는 항목끼리 두번째 조건을 적용하여 정렬
-- --------------------------------------------------------

SELECT
       menu_name
     , orderable_status
  FROM tbl_menu
 ORDER BY FIELD(orderable_status, 'N', 'Y') DESC;
-- --------------------------------------------------------
 
SELECT
       *
  FROM tbl_category
 ORDER BY -ref_category_code DESC;
 
SELECT
       *
  FROM tbl_category
 ORDER BY -ref_category_code ASC;