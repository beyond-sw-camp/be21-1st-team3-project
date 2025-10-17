#대여소 수정

#대여소 사용 가능 여부 변경
DELIMITER //

CREATE PROCEDURE rental_station_update_use(
IN r_id int(11),
IN r_use tinyInt(1)
)
BEGIN
	UPDATE rental_station
	SET station_use = r_use
	WHERE station_id = r_id;
END//

DELIMITER ;

#test
CALL rental_station_update_use(21,0);
SELECT * FROM rental_station;



#대여소 운영시간 변경
DELIMITER //

CREATE PROCEDURE rental_station_update_time(
IN r_id int(11),
IN r_OpenTime TIME,
IN r_CloseTime TIME
)
BEGIN
	UPDATE rental_station
	SET open_time=r_OpenTime, close_time=r_CloseTime
	WHERE station_id = r_id;
END//

DELIMITER ;

#test
CALL rental_station_update_time(21,'12:12:12','20:20:20');
SELECT * FROM rental_station;

