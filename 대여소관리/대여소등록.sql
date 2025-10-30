#대여소 등록
DELIMITER //
CREATE PROCEDURE rental_station_insert(
	IN r_loc VARCHAR(255),
	IN r_use TINYINT(1),
	IN r_OpenTime TIME,
	IN r_CloseTime TIME
)
BEGIN
	INSERT INTO rental_station (
					station_loc_code,
					station_use,
					open_time,
					close_time)
	VALUES(r_loc, r_use, r_OpenTime, r_CloseTime);
END //
DELIMITER ;

#test
CALL rental_station_insert('중구',1,'07:11:00','08:11:00');
SELECT * FROM rental_station;