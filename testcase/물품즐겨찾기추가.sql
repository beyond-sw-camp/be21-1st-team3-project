# 물품 즐겨찾기 추가
DELIMITER //

CREATE PROCEDURE like_category_insert (
    IN p_user_id INT,
    IN p_product_id INT
)
BEGIN
    -- 1️ 중복 즐겨찾기 방지
    IF EXISTS (
        SELECT 1
        FROM like_category
        WHERE user_id = p_user_id
          AND product_id = p_product_id
    ) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = '이미 즐겨찾기한 물품입니다.';
    
    -- 2️ 즐겨찾기 등록
    ELSE
        INSERT INTO like_category (
            user_id,
            product_id,
            create_date
        )
        VALUES (
            p_user_id,
            p_product_id,
            NOW()
        );
    END IF;
END //

DELIMITER ;

#test
CALL like_category_insert(3, 3);