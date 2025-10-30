-- 그룹 참가
DROP PROCEDURE IF EXISTS group_invite_member;

DELIMITER //

CREATE PROCEDURE group_invite_member(
    IN p_group_id INT,
    IN p_user_id INT
)
BEGIN
    DECLARE v_group_exists INT DEFAULT 0;
    DECLARE v_user_exists INT DEFAULT 0;
    DECLARE v_already_member INT DEFAULT 0;
    -- 1. 그룹 존재 여부 확인
    SELECT COUNT(*) INTO v_group_exists
    FROM groups
    WHERE group_id = p_group_id;
    IF v_group_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '해당 그룹이 존재하지 않습니다';
    END IF;
    -- 2. 사용자 존재 여부 확인 (회원가입 여부)
    SELECT COUNT(*) INTO v_user_exists
    FROM users
    WHERE user_id = p_user_id;
    IF v_user_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '회원가입된 사용자만 초대할 수 있습니다';
    END IF;
    -- 3. 이미 그룹에 존재하는 멤버인지 확인
    SELECT COUNT(*) INTO v_already_member
    FROM group_member_map
    WHERE group_id = p_group_id
      AND user_id = p_user_id;
    IF v_already_member > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '이미 그룹에 속한 사용자입니다';
    END IF;
    -- 4. 그룹에 새 멤버 추가
    INSERT INTO group_member_map (group_id, user_id, join_date)
    VALUES (p_group_id, p_user_id, NOW());
END //
DELIMITER ;


CALL group_invite_member(7, 3);
