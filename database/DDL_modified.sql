-- 1) users
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255),
    birthday DATE,
    gender VARCHAR(50),
    nickname VARCHAR(255),
    tel VARCHAR(50),
    enter_date DATETIME,
    cancel_date DATETIME,
    is_admin BOOLEAN DEFAULT FALSE,
    create_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(255),
    modify_date DATETIME ON UPDATE CURRENT_TIMESTAMP
);

-- 2) groups
CREATE TABLE groups (
    group_id INT PRIMARY KEY,
    group_name VARCHAR(255),
    member_num INT,              -- 오타 수정: memeber_num → member_num
    group_pw VARCHAR(255),
    create_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 3) group_member_map
CREATE TABLE group_member_map (
    group_id INT NOT NULL,
    user_id INT NOT NULL,
    join_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (group_id, user_id),
    FOREIGN KEY (group_id) REFERENCES groups(group_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- 4) bulletin
CREATE TABLE bulletin (
    bulletin_id INT PRIMARY KEY,
    writer_id INT NOT NULL,
    title VARCHAR(255),
    content VARCHAR(1000),
    bulletin_image_id INT,
    station_id INT,
    fee INT,
    create_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    modify_date DATETIME ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (writer_id) REFERENCES users(user_id)
);

-- 5) bulletin_images
CREATE TABLE bulletin_images (
    image_id INT PRIMARY KEY,
    image_path VARCHAR(1024) NOT NULL,
    bulletin_id INT NOT NULL,
    FOREIGN KEY (bulletin_id) REFERENCES bulletin(bulletin_id)
);

-- 6) products_category
CREATE TABLE products_category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(255),
    parent_category_id INT,
    FOREIGN KEY (parent_category_id) REFERENCES products_category(category_id)
);

-- 7) products
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    category_id INT,
    product_name VARCHAR(255),
    status_code CHAR(2),
    FOREIGN KEY (category_id) REFERENCES products_category(category_id)
);

-- 8) like_category
CREATE TABLE like_category (
    like_category_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    category_id INT NOT NULL,
    create_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (category_id) REFERENCES products_category(category_id)
);

-- 9) evaluation
CREATE TABLE evaluation (
    evaluation_id INT PRIMARY KEY,
    target_product_id INT NULL,
    target_user_id INT NULL,
    rating DECIMAL(2,1) CHECK (rating BETWEEN 0.0 AND 5.0),
    comment VARCHAR(1000),
    create_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (target_product_id) REFERENCES products(product_id),
    FOREIGN KEY (target_user_id) REFERENCES users(user_id)
);

-- 10) comment
CREATE TABLE comment (
    comment_id INT PRIMARY KEY,
    bulletin_id INT NOT NULL,
    writer_id INT NOT NULL,
    content VARCHAR(1000),
    create_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    modify_date DATETIME ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (bulletin_id) REFERENCES bulletin(bulletin_id),
    FOREIGN KEY (writer_id) REFERENCES users(user_id)
);

-- 11) report
CREATE TABLE report (
    report_id INT PRIMARY KEY,
    target_bulletin_id INT NULL,
    target_comment_id INT NULL,
    target_user_id INT NULL,
    reporter_id INT NOT NULL,
    reason VARCHAR(1000),
    create_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (target_bulletin_id) REFERENCES bulletin(bulletin_id),
    FOREIGN KEY (target_comment_id) REFERENCES comment(comment_id),
    FOREIGN KEY (target_user_id) REFERENCES users(user_id),
    FOREIGN KEY (reporter_id) REFERENCES users(user_id)
);

-- 12) bookmark
CREATE TABLE bookmark (
    bookmark_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    target_user_id INT NULL,
    target_product_id INT NULL,
    create_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (target_user_id) REFERENCES users(user_id),
    FOREIGN KEY (target_product_id) REFERENCES products(product_id)
);

-- 13) rental_station
CREATE TABLE rental_station (
    station_id INT PRIMARY KEY,
    station_loc_code CHAR(12) NOT NULL,
    station_use BOOLEAN DEFAULT TRUE,
    open_time TIME,
    close_time TIME
);

-- 14) reservation_return
CREATE TABLE reservation_return (
    reservation_id INT PRIMARY KEY,
    renter_id INT NOT NULL,
    start_time DATETIME,
    expected_return DATETIME,
    actual_return DATETIME,
    product_id INT NOT NULL,
    bulletin_id INT NOT NULL,
    station_id INT NOT NULL,
    FOREIGN KEY (renter_id) REFERENCES users(user_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (bulletin_id) REFERENCES bulletin(bulletin_id),
    FOREIGN KEY (station_id) REFERENCES rental_station(station_id)
);

