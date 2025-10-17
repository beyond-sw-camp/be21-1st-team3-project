#신고 입력 제약 조건
DELIMITER //

CREATE TRIGGER trg_report_check_target
BEFORE UPDATE ON report
FOR EACH ROW
BEGIN
    DECLARE cnt INT;
    SET cnt = 
        (NEW.target_bulletin_id IS NOT NULL) +
        (NEW.target_comment_id IS NOT NULL) +
        (NEW.target_user_id IS NOT NULL);

    IF cnt <> 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Exactly one of target_bulletin_id, target_comment_id, or target_user_id must be NOT NULL';
    END IF;
END //

DELIMITER ;

#신고 수정 제약조건
DELIMITER //

CREATE TRIGGER trg_report_check_target_update
BEFORE UPDATE ON report
FOR EACH ROW
BEGIN
    DECLARE cnt INT;
    SET cnt = 
        (NEW.target_bulletin_id IS NOT NULL) +
        (NEW.target_comment_id IS NOT NULL) +
        (NEW.target_user_id IS NOT NULL);

    IF cnt <> 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Exactly one of target_bulletin_id, target_comment_id, or target_user_id must be NOT NULL';
    END IF;
END //

DELIMITER ;



#신고 삭제
DELIMITER //
CREATE PROCEDURE report_delete(
r_id INT(11))

BEGIN
	DELETE 
	FROM report
	WHERE report.report_id=r_id;
END //


DELIMITER ;

#test
CALL report_delete(15);
SELECT * FROM report;
