DELIMITER // 
CREATE PROCEDURE bulletin_select(
  IN order_std VARCHAR(255)
)
BEGIN 
  SELECT * 
  FROM bulletin a
  JOIN products b ON a.bulletin_id = b.bulletin_id  
 ORDER BY order_std
END //

DELIMITER ;

