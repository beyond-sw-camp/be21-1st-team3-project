#대여소검색
DELIMITER //

CREATE PROCEDURE rental_station_select (
    IN r_loc VARCHAR(255),
    IN r_open TIME,
    IN r_close TIME
)
BEGIN
    SELECT 
        rs.station_loc_code,
        loc.loc_name,
        rs.station_use,
        rs.open_time,
        rs.close_time
    FROM rental_station rs
    JOIN location loc 
        ON rs.station_loc_code = loc.loc_id
    WHERE
        (r_loc IS NULL OR loc.loc_name LIKE CONCAT('%', r_loc, '%'))
        AND
        (r_open IS NULL OR rs.open_time <= r_open)
        AND
        (r_close IS NULL OR rs.close_time >= r_close);
END //

DELIMITER ;

#test
CALL rental_station_select('중구',NULL,NULL);
CALL rental_station_select(NULL,'08:00:00','09:00:00');