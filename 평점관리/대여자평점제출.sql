# 대여자평점제출                                                                                                                                                                                                                                                                                                                                                     

DROP PROCEDURE IF EXISTS evaluation_submit_user;

DELIMITER //

CREATE PROCEDURE evaluation_submit_user(
    IN p_evaluator_id INT,
    IN p_target_user_id INT,
    IN p_rating DECIMAL(2,1)
)
BEGIN
    -- 평점 유효성 확인
    IF p_rating < 0.0 OR p_rating > 5.0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '평점은 0.0~5.0 범위여야 합니다.';
    END IF;

    -- 대상 사용자 확인
    IF p_target_user_id IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '대상 사용자가 반드시 지정되어야 합니다.';
    END IF;

    -- 평가 삽입
    INSERT INTO evaluation (
        evaluator_id,
        target_user_id,
        rating,
        create_date
    ) VALUES (
        p_evaluator_id,
        p_target_user_id,
        p_rating,
        NOW()
    );
END //

DELIMITER ;


CALL evaluation_submit_user(7, 13, 4.1);
