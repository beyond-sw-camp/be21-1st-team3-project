#대여소 삭제

DELIMITER //

CREATE PROCEDURE rental_station_delete(
IN r_id INT(11))
BEGIN
	DELETE
	FROM rental_station
	WHERE station_id=r_id;
END //
DELIMITER ;

#test
CALL rental_station_delete(21);
SELECT * FROM rental_station;