-- 06. JOIN

SELECT
       *
  FROM tbl_menu 
  JOIN tbl_category ON (tbl_menu.category_code = tbl_category.category_code);
  
SELECT
       menu_name
     , category_name
  FROM tbl_menu
  JOIN tbl_category ON (tbl_menu.category_code = tbl_category.category_code);  
  
SELECT
		 menu_name
     , category_name
  FROM tbl_menu a
  JOIN tbl_category b ON (a.category_code = b.category_code);
-- ----------------------------------------------------------------------

-- inner join
SELECT
		 *
  FROM tbl_menu a
  JOIN tbl_category b ON (a.category_code = b.category_code)
 WHERE b.category_code = 7;   -- tbl_menu에 category_code가 7인 항목이 존재하지 않아서 조회 결과 없음

-- left join
SELECT
		 *
  FROM tbl_menu a
  LEFT JOIN tbl_category b ON (a.category_code = b.category_code);

-- right join
SELECT
		 *
  FROM tbl_menu a
 RIGHT JOIN tbl_category b ON (a.category_code = b.category_code);
-- ----------------------------------------------------------------------

-- cross join
SELECT
		 a.menu_name
     , b.category_name		
  FROM tbl_menu a
 CROSS JOIN tbl_category b;

SELECT
		 *
  FROM tbl_menu a
  JOIN tbl_category b ON (1 = 1);   -- 항상 TRUE이므로 모든 결합이 실행
-- ----------------------------------------------------------------------

-- self join
SELECT
       *
  FROM tbl_category;
  
SELECT
		 a.category_name
     , b.category_name
  FROM tbl_category a
  JOIN tbl_category b ON a.category_code = b.ref_category_code;   -- ref가 상위 구분 속성