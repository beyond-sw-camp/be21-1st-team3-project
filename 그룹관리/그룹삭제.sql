# 그룹 삭제
DROP PROCEDURE IF EXISTS group_delete;

DELIMITER //

CREATE PROCEDURE group_delete(
    IN p_group_id INT,
    IN p_user_id INT
)
BEGIN
    DECLARE v_is_member INT DEFAULT 0;
    DECLARE v_exists INT DEFAULT 0;

    -- 1. 그룹 존재 여부 확인
    SELECT COUNT(*) INTO v_exists
    FROM groups
    WHERE group_id = p_group_id;

    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '해당 그룹이 존재하지 않습니다';
    END IF;

    -- 2. 사용자가 해당 그룹의 멤버인지 확인
    SELECT COUNT(*) INTO v_is_member
    FROM group_member_map
    WHERE group_id = p_group_id
      AND user_id = p_user_id;

    IF v_is_member = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '그룹에 속한 사용자만 그룹을 삭제할 수 있습니다';
    END IF;

    -- 3. 그룹 삭제 (그룹과 멤버 매핑 모두 제거)
    DELETE FROM group_member_map WHERE group_id = p_group_id;
    DELETE FROM groups WHERE group_id = p_group_id;

END //

DELIMITER ;


CALL group_delete(7, 7);
