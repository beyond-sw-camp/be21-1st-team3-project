-- 그룹생성
DROP PROCEDURE IF EXISTS group_create;

DELIMITER //

CREATE PROCEDURE group_create(
    IN p_group_name TEXT,
	IN p_member_num INT,
    IN p_group_pw TEXT,
    IN p_description TEXT
)
BEGIN
    -- 그룹 추가
    INSERT INTO groups (group_name, member_num, group_pw, create_date, description)
    VALUES (p_group_name, p_member_num, p_group_pw, NOW(), p_description);
END //

DELIMITER ;

CALL group_create('쌩쌩달리자', 3, 'xingxing','전동 킥보드 공유하실 분 구합니다');

