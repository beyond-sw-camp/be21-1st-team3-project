# 대여자평점조회

DROP PROCEDURE IF EXISTS evaluation_check_user;

DELIMITER //

CREATE PROCEDURE evaluation_check_user(
    IN p_target_user_id INT
)
BEGIN
    -- 대상 사용자가 NULL이면 에러
    IF p_target_user_id IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '조회할 사용자 ID를 입력해야 합니다.';
    END IF;

    -- 평균 평점 조회
    SELECT 
        ROUND(AVG(rating), 2) AS average_rating,
        COUNT(*) AS evaluation_count
    FROM evaluation
    WHERE target_user_id = p_target_user_id;

END //

DELIMITER ;


-- 대여자 ID 13의 평점 조회
CALL evaluation_check_user(13);

