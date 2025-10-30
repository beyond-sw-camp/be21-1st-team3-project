# 댓글 수정

DROP PROCEDURE IF EXISTS update_comment;

DELIMITER //

CREATE PROCEDURE update_comment(
    IN p_comment_id INT,
    IN p_user_id INT,
    IN p_new_content TEXT
)
BEGIN
    DECLARE comment_owner INT;
    -- 1. 댓글 작성자가 본인인지 확인
    SELECT writer_id INTO comment_owner
    FROM comment
    WHERE comment_id = p_comment_id;

    IF comment_owner IS NULL THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = '해당 댓글이 존재하지 않습니다';
    ELSEIF comment_owner != p_user_id THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '본인 댓글만 수정할 수 있습니다';
    END IF;

    -- 2. 댓글 내용 및 수정 시각 갱신
    UPDATE comment
    SET content = p_new_content,
        modify_date = NOW()
    WHERE comment_id = p_comment_id;

END //

DELIMITER ;

CALL update_comment(31, 11, '댓글 수정');
CALL update_comment(31, 8, '본인이 쓰지 않은 댓글 수정 시도');
CALL update_comment(79, 8, '존재하지 않는 댓글 수정 시도');
