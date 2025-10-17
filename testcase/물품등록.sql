DELIMITER //
CREATE PROCEDURE bulletin_insert (
  IN cg_id INT 
, IN pd_name VARCHAR(255)
, IN st_code CHAR(2)
, IN writer_id INT  
, IN title VARCHAR(255)
, IN content VARCHAR(1000) 
, IN station_id INT 
, IN fee INT 
)
BEGIN  
  INSERT INTO bulletin
  VALUES 
  (NULL, title, content, writer_id, station_id, fee);

  SET @b_id := LAST_INSERT_ID();

  INSERT INTO products
  VALUES  
  (NULL, @b_id, pd_name, st_code, cg_id, writer_id);
  
  
END //

DELIMITER ;


-- test code
DELETE FROM bulletin WHERE bulletin_id = 9;
CALL bulletin_insert(1, '샘플샘플', 'A1', 1, '제목제목', '내용내용', 1, 2000);
SELECT * FROM bulletin ORDER BY bulletin_id DESC LIMIT 3;