-- Question 1: Thêm ít nhất 10 record vào mỗi table

-- Question 2: lấy ra tất cả các phòng ban
SELECT * FROM departments;

-- Question 3: lấy ra id của phòng ban "Sale"
SELECT	department_id 
FROM	departments 
WHERE	department_name = 'Sale';

-- Question 4: lấy ra thông tin account có full name dài nhất
SELECT * FROM accounts WHERE LENGTH(fullname) =  (SELECT MAX(LENGTH(fullname)) FROM accounts);

-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3
SELECT * FROM accounts WHERE (LENGTH(fullname) = (SELECT MAX(LENGTH(fullname)) FROM accounts)) AND department_id = 3;

-- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT		g.group_name
FROM		`groups` g
INNER JOIN	group_accounts ga
ON			g.group_id = ga.group_id
WHERE		join_date <= '2021-10-5';

-- Question 7: Lấy ra ID của question có >= 4 câu trả lời
SELECT		q.question_id 
FROM		questions q
INNER JOIN	answers a
ON			q.question_id = a.question_id
GROUP BY	q.question_id
HAVING COUNT(a.question_id) >= 2;

-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019
SELECT	`code`
FROM	exams
WHERE	duration >= 60
AND		create_date < '2021-10-11';

-- Question 9: Lấy ra 5 group được tạo gần đây nhất
SELECT *
FROM `groups`
ORDER BY created_date DESC
LIMIT 5;
    
-- Question 10: Đếm số nhân viên thuộc department có id = 2
SELECT COUNT(account_id)
FROM		accounts 
WHERE		department_id=2;

-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT fullname
FROM `account`
WHERE (SUBSTRING_INDEX(fullName, ' ', -1)) LIKE 'D%o' ;

-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE
FROM exam
WHERE create_date < '2019-12-20';

-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
DELETE
FROM `questions`
WHERE (SUBSTRING_INDEX(content,' ',2)) ='câu hỏi';

-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
UPDATE `accounts`
SET fullname = 'Nguyen Ba Loc',
email = 'loc.nguyenba@vti.com.vn'
WHERE account_id = 5;

-- Question 15: update account có id = 5 sẽ thuộc group có id = 4
UPDATE `group_accounts` 
SET account_id = 5
WHERE group_id = 4;


