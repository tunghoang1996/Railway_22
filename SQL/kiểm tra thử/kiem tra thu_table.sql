

DROP DATABASE IF EXISTS bai_kiem_tra_SQL;
CREATE DATABASE IF NOT EXISTS bai_kiem_tra_SQL;
USE bai_kiem_tra_SQL;

DROP TABLE IF EXISTS
customer,
car,
car_order;

CREATE TABLE customer
(
customer_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`name` 		VARCHAR(100) NOT NULL,
phone 		CHAR(10) NOT NULL,
email 		VARCHAR(100) NOT NULL,
address	 	VARCHAR(100) NOT NULL,
note		TEXT
);


CREATE TABLE car
(
car_id 	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
maker 	ENUM("HONDA","TOYOTA","NISSAN") DEFAULT "HONDA",
model 	VARCHAR(100) NOT NULL,
`year`	YEAR NOT NULL,
color 	VARCHAR(100) NOT NULL,
note 	TEXT
);


CREATE TABLE car_order
(
order_id			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
customer_id 		TINYINT UNSIGNED,
car_id 				TINYINT UNSIGNED,
amount 				TINYINT UNSIGNED DEFAULT "1",
sale_price  		INT UNSIGNED NOT NULL,
order_date 			DATE NOT NULL,
delivery_date		DATE,
delivery_address 	VARCHAR(300) NOT NULL,
staus 				ENUM ("0","1","2") DEFAULT "0",
note 				TEXT,
FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
FOREIGN KEY(car_id) REFERENCES car(car_id)
);

