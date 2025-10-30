# 댓글 신고
DROP PROCEDURE IF EXISTS comment_report;

DELIMITER //

CREATE PROCEDURE comment_report(
    IN p_comment_id INT,
    IN p_reporter_id INT,
    IN p_reason VARCHAR(255)
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
    ELSEIF comment_owner = p_reporter_id THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '본인 댓글은 신고할 수 없습니다';
    END IF;

    -- 2. 신고 기록 추가
    INSERT INTO comment_report(comment_id, reporter_id, reason, create_date)
    VALUES(p_comment_id, p_reporter_id, p_reason, NOW());

END //

DELIMITER ;

CALL comment_report(2, 1, '부적절한 댓글');
