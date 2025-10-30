DELIMITER //

CREATE PROCEDURE bulletin_delete (
  IN b_id INT
)
BEGIN
  DELETE FROM bulletin
  WHERE bulletin_id = b_id;
END //

DELIMITER ;

-- DROP PROCEDURE bulletin_delete;
-- test code
CALL bulletin_delete(10);

