INSERT INTO users (user_id, name, email, password, birthday, gender, nickname, tel)
VALUES
(1, '이용우', 'yongwoo@example.com', 'pw1234', '2000-05-15', 'M', '용우짱', '010-1111-2222'),
(2, '이경민', 'kyungmin@example.com', 'pw5678', '1999-07-02', 'F', '민짱', '010-3333-4444'),
(3, '이하경', 'hakyeong@example.com', 'pw9012', '2001-03-10', 'F', '하경이', '010-5555-6666'),
(4, '이인재', 'injae@example.com', 'pw3456', '1998-12-24', 'M', '인재형', '010-7777-8888'),
(5, '박서준', 'seojun@example.com', 'pw7890', '1997-09-11', 'M', '서준', '010-9999-0000');

INSERT INTO rental_station (station_id, station_name, station_use, open_time, close_time)
VALUES
(1, '중구대여소', 1, '07:00:00', '20:00:00'),
(2, '강남대여소', 1, '08:00:00', '22:00:00'),
(3, '홍대입구대여소', 1, '06:00:00', '21:00:00'),
(4, '건대입구대여소', 0, '09:00:00', '18:00:00'),
(5, '잠실대여소', 1, '07:30:00', '23:00:00');

INSERT INTO bulletin (bulletin_id, title, content, writer_id, station_id, fee)
VALUES
(1, '자전거 대여합니다', '상태 좋은 자전거 대여합니다.', 1, 1, 2000),
(2, '캠핑용 의자 대여', '접이식 의자 2개 세트 대여 가능', 2, 2, 3000),
(3, '전동킥보드 빌려드립니다', '충전 완충 상태, 3시간 사용 가능', 3, 3, 5000),
(4, '보드게임 대여', '카탄, 젠가 등 보드게임 있습니다.', 4, 4, 1000),
(5, '카메라 렌즈 대여', '캐논 EF 50mm 렌즈입니다.', 5, 5, 4000);

INSERT INTO report (report_id, target_bulletin_id, reporter_id, reason, create_date)
VALUES
(1, 1, 2, '허위 정보로 의심됨', NOW()),
(2, 2, 3, '사진이 실제와 다름', NOW()),
(3, 3, 4, '연락이 되지 않음', NOW()),
(4, 4, 1, '부적절한 내용', NOW()),
(5, 5, 2, '가격 허위 표기', NOW());

INSERT INTO reservation_history (reservation_id, start_time, expected_return, actual_return, bulletin_id, renter_id)
VALUES
(1, NOW(), DATE_ADD(NOW(), INTERVAL 3 HOUR), NULL, 1, 2),
(2, NOW(), DATE_ADD(NOW(), INTERVAL 5 HOUR), NULL, 2, 3),
(3, NOW(), DATE_ADD(NOW(), INTERVAL 2 HOUR), NULL, 3, 4),
(4, NOW(), DATE_ADD(NOW(), INTERVAL 4 HOUR), NULL, 4, 5),
(5, NOW(), DATE_ADD(NOW(), INTERVAL 6 HOUR), NULL, 5, 1);

INSERT INTO comment (comment_id, bulletin_id, writer_id, content, create_date)
VALUES
(1, 1, 2, '좋은 물건이네요!', NOW()),
(2, 1, 3, '예약 가능한가요?', NOW()),
(3, 2, 1, '하루 단위도 가능한가요?', NOW()),
(4, 3, 4, '연락드렸습니다.', NOW()),
(5, 5, 2, '대여 완료했습니다 감사합니다.', NOW());

INSERT INTO bulletin_images (image_id, image_path, bulletin_id)
VALUES
(1, '/images/bike.jpg', 1),
(2, '/images/chair.jpg', 2),
(3, '/images/scooter.jpg', 3),
(4, '/images/boardgame.jpg', 4),
(5, '/images/lens.jpg', 5);

INSERT INTO comment_report (comment_report_id, comment_id, reporter_id, reason, create_date)
VALUES
(1, 1, 3, '욕설 포함', NOW()),
(2, 2, 4, '스팸성 댓글', NOW()),
(3, 3, 2, '부적절한 표현', NOW()),
(4, 4, 5, '광고성 댓글', NOW()),
(5, 5, 1, '도배성 내용', NOW());

INSERT INTO products_category (category_id, category_name, parent_category_id)
VALUES
(1, '전자제품', NULL),
(2, '생활가전', 1),
(3, '주방가전', 1),
(4, '스포츠용품', NULL),
(5, '패션잡화', NULL);

INSERT INTO products (product_id, bulletin_id, product_name, status_code, category_id, writer_id)
VALUES
(1, 1, '자전거', 'A1', 1, 1),
(2, 2, '캠핑의자', 'A1', 2, 2),
(3, 3, '전동킥보드', 'A1', 1, 3),
(4, 4, '보드게임세트', 'A2', 4, 4),
(5, 5, '카메라렌즈', 'A1', 1, 5);

INSERT INTO like_category (like_category_id, user_id, product_id, create_date)
VALUES
(1, 1, 2, NOW()),
(2, 2, 3, NOW()),
(3, 3, 1, NOW()),
(4, 4, 5, NOW()),
(5, 5, 4, NOW());

INSERT INTO evaluation (evaluation_id, evaluator_id, target_product_id, rating, create_date)
VALUES
(1, 1, 1, 4.5, NOW()),
(2, 2, 2, 5.0, NOW()),
(3, 3, 3, 3.8, NOW()),
(4, 4, 4, 4.2, NOW()),
(5, 5, 5, 4.9, NOW());

INSERT INTO groups (group_id, group_name, member_num, group_pw, description)
VALUES
(1, '등산모임', 10, 'pw123', '주말 등산 함께 가요'),
(2, '캠핑클럽', 7, 'pw456', '캠핑용품 공유 및 후기'),
(3, '사진동아리', 8, 'pw789', '사진 촬영과 렌즈 공유'),
(4, '보드게임모임', 6, 'pw111', '보드게임 같이 해요'),
(5, '자전거클럽', 12, 'pw222', '라이딩과 장비 공유');

INSERT INTO group_member_map (group_id, user_id, join_date)
VALUES
(1, 1, NOW()),
(1, 2, NOW()),
(2, 3, NOW()),
(3, 4, NOW()),
(4, 5, NOW());
