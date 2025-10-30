# 물품평점제출

DROP PROCEDURE IF EXISTS evaluation_submit_product;

DELIMITER //

CREATE PROCEDURE evaluation_submit_product(
    IN p_evaluator_id INT,
    IN p_target_product_id INT,
    IN p_rating DECIMAL(2,1)
)
BEGIN
    -- 평점 유효성 확인
    IF p_rating < 0.0 OR p_rating > 5.0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '평점은 0.0~5.0 범위여야 합니다.';
    END IF;

    -- 대상 물품 확인
    IF p_target_product_id IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '대상 물품이 반드시 지정되어야 합니다.';
    END IF;

    -- 평가 삽입
    INSERT INTO evaluation (
        evaluator_id,
        target_product_id,
        rating,
        create_date
    ) VALUES (
        p_evaluator_id,
        p_target_product_id,
        p_rating,
        NOW()
    );
END //

DELIMITER ;


CALL evaluation_submit_product(7, 11, 4.2);
