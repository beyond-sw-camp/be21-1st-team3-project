DELIMITER //
CREATE PROCEDURE bulletin_update (
  IN b_id INT 
, IN b_field VARCHAR(255)
, IN modified_val VARCHAR(1000)
)
BEGIN  
  DECLARE modified_int INT; -- if you need
  CASE  
    WHEN b_field = 'title' THEN
      UPDATE bulletin
      SET title = modified_val
      WHERE bulletin_id = b_id;
    WHEN b_field = 'content' THEN 
      UPDATE bulletin
      SET content = modified_val
      WHERE bulletin_id = b_id;
    WHEN b_field = 'station_id' THEN  -- need to cast
      SET modified_int := CAST(modified_val AS SIGNED);
      UPDATE bulletin
      SET station_id = modified_int
      WHERE bulletin_id = b_id;
    WHEN b_field = 'fee' THEN         -- need to cast
      SET modified_int := CAST(modified_val AS SIGNED);
      UPDATE bulletin
      SET fee = modified_int
      WHERE bulletin_id = b_id;
    WHEN b_field = 'category_id' THEN 
      SET modified_int := CAST(modified_val AS SIGNED);
      UPDATE products
      SET category_id = modified_int
      WHERE bulletin_id = b_id; 
    WHEN b_field = 'product_name' THEN
      UPDATE products
      SET product_name = modified_val
      WHERE bulletin_id = b_id;
  END CASE;
END //

DELIMITER ;



-- test code
-- bulletin_id가 46인 게시글의 물품명(product_name) 변경
CALL bulletin_update(46, 'product_name', '물품명수정');
SELECT * FROM bulletin ORDER BY bulletin_id DESC LIMIT 3;