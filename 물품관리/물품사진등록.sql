DELIMITER //
CREATE PROCEDURE bulletin_images_insert (
  IN image_path VARCHAR(1024)
, IN bulletin_id INT 
)
BEGIN  
  INSERT INTO bulletin_images 
  VALUES
  (NULL, image_path, bulletin_id);
END //

DELIMITER ;


-- test code
SET @b_id = 46; 
SET @i_path = '/img/b46_2.jpg';
CALL bulletin_images_insert(@i_path, @b_id);
SELECT * FROM bulletin_images ORDER BY image_id DESC LIMIT 3;

