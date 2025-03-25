DROP TABLE users;
DROP TABLE products;
DROP TABLE reviews;
DROP TABLE orders;

DELETE FROM users;

-- 사용자 테이블 생성
CREATE TABLE users
(
    user_id    INT PRIMARY KEY AUTO_INCREMENT,
    username   VARCHAR(255) UNIQUE NOT NULL,
    email      VARCHAR(255) UNIQUE NOT NULL,
    age        INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE users RENAME COLUMN username TO nickname;

SET time_zone = 'Asia/Seoul'; -- 한국시간으로 바꾸는 방법

INSERT INTO users (username, email, age)
VALUES ('song', '234@naver.com', 20);

INSERT INTO users (username, email, age)
VALUES ('kim', 'sdf@naver.com', 23);

select * from users;

UPDATE users SET email = 'choi@naver.com', age = 30 WHERE user_id = 2;

UPDATE users SET users.created_at = now() WHERE user_id = 2;

SELECT now();

SELECT CONVERT_TZ(CURRENT_TIMESTAMP, 'UTC', 'Asia/Seoul');

-- 상품 테이블 생성
CREATE TABLE products
(
    product_id   INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255)   NOT NULL,
    price        DECIMAL(10, 2) NOT NULL,
    category     VARCHAR(255),
    stock        INT DEFAULT 0
);

-- 주문 테이블 생성
CREATE TABLE orders
(
    order_id   INT PRIMARY KEY AUTO_INCREMENT,
    user_id    INT,
    product_id INT,
    quantity   INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);

-- 리뷰 테이블 생성
CREATE TABLE reviews
(
    review_id  INT PRIMARY KEY AUTO_INCREMENT,
    user_id    INT,
    product_id INT,
    rating     INT,
    comment    TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);

