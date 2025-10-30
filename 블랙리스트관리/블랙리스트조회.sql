DELIMITER //

CREATE PROCEDURE blk_select()
BEGIN
	SELECT *
	FROM users
	WHERE blk=1;
END //


DELIMITER ;
CALL blk_select();