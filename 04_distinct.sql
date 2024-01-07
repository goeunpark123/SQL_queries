-- 04. DISTINCT

SELECT
       DISTINCT category_code
  FROM tbl_menu;

SELECT
       DISTINCT category_code
	  , orderable_status
  FROM tbl_menu;  
  
SELECT
       DISTINCT ref_category_code
  FROM tbl_category;
-- --------------------------------------------------------

SELECT
       DISTINCT ref_category_code
  FROM tbl_category
 ORDER BY 1 DESC;

SELECT
       DISTINCT ref_category_code
  FROM tbl_category
 ORDER BY ref_category_code DESC;   -- 비효율
 
SELECT
       DISTINCT ref_category_code AS 'c_code'
  FROM tbl_category
 ORDER BY -c_code DESC;   -- 별칭에 distinct까지 적용한 결과가 저장
 
-- SELECT
--        DISTINCT ref_category_code
--   FROM tbl_category
--  ORDER BY DISTINCT ref_category_code DESC;