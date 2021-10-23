

INSERT INTO customer 	
(`name`			, phone 	, email				 	, address			  		, note      			)
VALUES					
("Nguyen Van A" , 0123456521, "nguyenvanA@gmail.com", "Thanh Xuan, Ha Noi"	, "mua cho ban gai"     	 ),						
("Nguyen Van B" , 0123591002, "nguyenvanB@gmail.com", "Cau Giay, Ha Noi"	, "mua tang vo"        		 ),
("Tran Van C" 	, 0178954699, "tranvanC@gmail.com"  , "Tu Son, Bac Ninh"	, "duoc cong ty thuong"      ),
("Dang Thi D" 	, 0126598975, "dangthiD@gmail.com"  , "Van Don, Quang Ninh"	, "mua cho con trai"     	 ),
("Dao Thi E" 	, 0123544494, "daothiE@gmail.com"	, "Luong Son, Hoa Binh"	, "tang sinh nhat ban"    	 );
 

INSERT INTO car
( maker		, model		, `year`	, color	, note					)
VALUES 
( "HONDA"	, "CITY"	, 2019		, "black"	, "den bong, dan nilong"),
( "TOYOTA"	, "VIOS"	, 2021		, "white"	, "trang su, dan nilong"),
( "NISSAN"	, "TERRA"	, 2010		, "red"		, "nau do dam limited"  ),
( "NISSAN"	, "SUNNY"	, 2019		, "black"	, "den bong, dan nilong"),
( "TOYOTA"	, "CAMRY"	, 2021		, "yellow"	, "mau vang cat"        );

INSERT INTO car_order
( customer_id 	, car_id	, amount	, sale_price 	, order_date		, delivery_date		, delivery_address								, staus		, note 			 			)
VALUES 
( 1				, 5			, "1"			, 1029000		, "2021-10-01"	,	"2021-10-15"	, "so 43 Nguyen Chi Thanh, Ngoc Khanh, Ba Dinh"	, "0"		, "khach hang da dat hang"	),
( 3				, 1			, "2"			, 640000		, "2021-09-10"	,	"2021-09-20"	, "toa SS12, Vinhome OceanPark, Gia lam, Ha Noi", "0"		, "khach hang da dat hang"	),
( 4				, 3			, "1"			, 899000		, "2021-08-15"	,	"2021-09-01"	, "xom ABC, Tu Son, Bac Ninh"					, "1"		, "da giao hang cho khach"	),
( 2				, 2			, "2"			, 599000		, "2021-03-09"	,	"2021-03-30"	, "toa SS06, Timecity, Hai Ba Trung, Ha Noi"	, "1"		, "da giao hang cho khach"	),
( 5				, 4			, "3"			, 540000		, "2021-05-16"	,	NULL			, "so 16 Kim Giang, Dai Kim, Hoang Mai"			, "2"		, "khach hang da huy"   	);  

