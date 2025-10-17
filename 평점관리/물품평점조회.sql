# 물품평점조회
DROP PROCEDURE IF EXISTS evaluation_check_product;

DELIMITER //

CREATE PROCEDURE evaluation_check_product(
    IN p_target_product_id INT
)
BEGIN
    DECLARE v_exists INT;

    -- 1. 물품 존재 여부 확인
    SELECT COUNT(*) INTO v_exists
    FROM products
    WHERE product_id = p_target_product_id;

    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '해당 물품이 존재하지 않습니다.';
    END IF;

    -- 2. 평균 평점 조회
    SELECT 
        ROUND(AVG(rating), 2) AS average_rating,
        COUNT(*) AS evaluation_count
    FROM evaluation
    WHERE target_product_id = p_target_product_id;

END //

DELIMITER ;



-- 물품ID 11의 평점 조회
CALL evaluation_check_product(11);

