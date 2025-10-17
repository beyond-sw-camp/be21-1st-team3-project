# 댓글 삭제
DROP PROCEDURE IF EXISTS comment_delete;

DELIMITER //

CREATE PROCEDURE comment_delete(
    IN p_comment_id INT,
    IN p_user_id INT
)
BEGIN
    DECLARE comment_owner INT;

    -- 1. 댓글 작성자 확인
    SELECT writer_id INTO comment_owner
    FROM comment
    WHERE comment_id = p_comment_id;

    IF comment_owner IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '해당 댓글이 존재하지 않습니다';
    ELSEIF comment_owner != p_user_id THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '본인 댓글만 삭제할 수 있습니다';
    END IF;

    -- 2. 댓글 삭제
    DELETE FROM comment
    WHERE comment_id = p_comment_id;

END //

DELIMITER ;


CALL comment_delete(1, 2); #댓글 삭제
CALL comment_delete(53, 7); #존재하지 않는 댓글 삭제 시도
CALL comment_delete(33, 1); #본인 댓글이 아닌 댓글 삭제 시도
