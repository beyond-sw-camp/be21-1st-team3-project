#블랙리스트 추가
DELIMITER //
CREATE PROCEDURE blk_insert(
IN b_id INT(11)
)
BEGIN
  UPDATE users
  SET users.blk=1
  ,users.blk_date= CURRENT_TIME
  WHERE users.user_id=b_id;

END //


DELIMITER ;

CALL blk_insert(3);
SELECT users.user_id,users.name, users.blk, users.blk_date FROM users WHERE users.user_id=3;