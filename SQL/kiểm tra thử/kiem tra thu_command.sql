
-- 2. Viết lệnh lấy ra thông tin của khách hàng: tên, số lượng oto khách hàng đã
-- mua và sắp sếp tăng dần theo số lượng oto đã mua.

SELECT c.`name`, SUM(co.amount) so_luong_xe_da_mua
FROM customer c
LEFT JOIN car_order co
	ON c.customer_id = co.customer_id
    WHERE co.staus = "1"
GROUP BY co.customer_id
ORDER BY SUM(co.amount);

-- 3. Viết hàm (không có parameter) trả về tên hãng sản xuất đã bán được nhiều
-- oto nhất trong năm nay.

DROP PROCEDURE IF EXISTS car_best_sales;
DELIMITER $$
CREATE PROCEDURE car_best_sales()
BEGIN	
		SELECT c.maker, co.amount so_luong_xe_da_ban_nam_2021
		FROM car c
		LEFT JOIN car_order co
			ON c.car_id = ca.car_id
            WHERE co.staus = "1"  AND YEAR(delivery_date)= YEAR(NOW())
		GROUP BY c.car_id
        HAVING SUM(co.amount) = (SELECT MAX(co.amount) FROM car_order);
	END $$
DELIMITER ;

CALL car_best_sales;

-- 4. Viết 1 thủ tục (không có parameter) để xóa các đơn hàng đã bị hủy của
-- những năm trước. In ra số lượng bản ghi đã bị xóa.

DROP PROCEDURE IF EXISTS delete_order;
DELIMITER $$
CREATE PROCEDURE delete_order()
	BEGIN	
		DELETE FROM car_order WHERE staus = "2" AND YEAR(delivery_date) < YEAR(NOW());
	END $$
DELIMITER ;

CALL delete_order;   

   
-- 5. Viết 1 thủ tục (có CustomerID parameter) để in ra thông tin của các đơn
-- hàng đã đặt hàng bao gồm: tên của khách hàng, mã đơn hàng, số lượng oto
-- và tên hãng sản xuất.




