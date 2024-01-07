-- 01. SELECT

SELECT menu_name FROM tbl_menu;
SELECT menu_name, menu_price FROM tbl_menu;
SELECT * FROM tbl_menu;
-- --------------------------------------------------------
 
SELECT 7+3;

SELECT 7+3 AS 합;
SELECT 7+3 AS '합';

-- SELECT 7+3 AS 7+3 =;
SELECT 7+3 '7+3 ='; -- 특수기호가 들어간 들어간 별칭은 '이 필요
-- ---------------------------------------------------------
 
SELECT NOW();
SELECT NOW() AS '현재 시간'; 
SELECT CONCAT('박', ' ', '고은');