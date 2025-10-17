DELIMITER //
CREATE PROCEDURE bulletin_images_update (
  IN image_path VARCHAR(1024)
, IN image_id INT 
)
BEGIN  
  DECLARE new_path VARCHAR(1024);
  DECLARE tg_id INT;
  
  SET new_path = image_path;
  SET tg_id = image_id; 
  
  UPDATE bulletin_images
  SET image_path = new_path
  WHERE image_id = tg_id
  LIMIT 1;
END //

DELIMITER ;

-- test code
SET @i_id = 1; 
SET @new_path = '/img/b1_NOO.jpg';
CALL bulletin_images_update('/img/b1_NOO.jpg', 1);
SELECT * FROM bulletin_images ORDER BY image_id DESC LIMIT 3;
