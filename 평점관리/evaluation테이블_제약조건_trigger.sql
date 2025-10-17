-- evaluation 테이블 제약조건 trigger

DELIMITER //

CREATE TRIGGER trg_evaluation
BEFORE INSERT ON evaluation
FOR EACH ROW
BEGIN
    DECLARE cnt INT;
    SET cnt = (NEW.target_product_id IS NOT NULL) + (NEW.target_user_id IS NOT NULL);
    
    IF cnt <> 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Exactly one of target_product_id or target_user_id must be NOT NULL';
    END IF;
END //

DELIMITER ;