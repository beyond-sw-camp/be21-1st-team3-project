#블랙리스트 해제
DELIMITER //

CREATE PROCEDURE blk_release (
    IN b_id INT
)
BEGIN
    DECLARE v_blk TINYINT;

    SELECT blk INTO v_blk
    FROM users
    WHERE user_id = b_id;

    IF v_blk = 1 THEN
        UPDATE users
        SET blk = 0,
            blk_release_date = NOW()
        WHERE user_id = b_id;
    ELSE
        SELECT '해당 사용자는 블랙 상태가 아닙니다.' AS message;
    END IF;
END //

DELIMITER ;

#test
 CALL blk_release(30);
 SELECT users.user_id,users.name, users.blk, users.blk_date, users.blk_release_date  FROM users WHERE users.user_id=30;
