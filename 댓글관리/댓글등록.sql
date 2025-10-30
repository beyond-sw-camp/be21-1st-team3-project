# 댓글 등록
DROP PROCEDURE IF EXISTS create_comment;

DELIMITER //

CREATE PROCEDURE create_comment(
    IN p_bulletin_id INT,
    IN p_writer_id INT,
    IN p_content TEXT
)
BEGIN
    -- 댓글 추가
    INSERT INTO comment (bulletin_id, writer_id, content, create_date)
    VALUES (p_bulletin_id, p_writer_id, p_content, NOW());
END //

DELIMITER ;

CALL create_comment(46, 7, '최고예요');
