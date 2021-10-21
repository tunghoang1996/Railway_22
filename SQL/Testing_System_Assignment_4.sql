-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT d.department_name,
 		a.fullname
 FROM departments d
 INNER JOIN accounts a
 ON d.department_id = a.department_id;

 -- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT *
FROM `accounts`
WHERE create_date < '2020-12-20';

-- Question 3: Viết lệnh để lấy ra tất cả các developer
SELECT *
FROM accounts a
LEFT JOIN positions p
ON a.position_id = p.position_id
WHERE p.position_name = 'Dev';
-- GROUP BY p.position_name;

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT d.department_id,
		d.department_name
FROM departments d
LEFT JOIN accounts a
ON d.department_id = a.department_id
GROUP BY a.department_id
HAVING COUNT(a.department_id)>3;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
SELECT *
FROM questions q
LEFT JOIN exam_questions e
ON q.question_id = e.question_id
GROUP BY q.question_id
HAVING COUNT(e.question_id) = (SELECT COUNT(question_id)
FROM exam_questions
GROUP BY question_id
ORDER BY question_id DESC
LIMIT 1);

-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT *
FROM category_questions cq 
INNER JOIN questions q
ON cq.category_id = q.category_id
GROUP BY q.category_id;

-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT q.question_id,
		q.content,
        eq.exam_id,
        COUNT(eq.question_id) 'amount'
FROM questions q
INNER JOIN exam_questions eq
ON q.question_id = eq.question_id
GROUP BY eq.question_id;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
SELECT *
FROM questions q
INNER JOIN answers a
ON q.question_id = a.question_id
GROUP BY a.question_id
HAVING COUNT(a.question_id) = (SELECT COUNT(question_id)
								FROM answers
								GROUP BY question_id
								ORDER BY question_id
								LIMIT 1);

-- Question 9: Thống kê số lượng account trong mỗi group
SELECT acc.account_id,
		acc.username,
        COUNT(gacc.account_id) amount,
        gacc.group_id 
FROM accounts acc
RIGHT JOIN group_accounts gacc
ON acc.account_id = gacc.account_id
GROUP BY gacc.account_id;

-- Question 10. Tìm chức vụ có ít người nhất  
SELECT	p.position_name,
		COUNT(p.position_id) so_nhan_vien
FROM	positions p
RIGHT JOIN	accounts a
ON	p.position_id = a.position_id
GROUP BY	a.position_id
HAVING	COUNT(p.position_id) = (SELECT COUNT(position_id)
								FROM accounts
								GROUP BY position_id
								ORDER BY COUNT(position_id)
								LIMIT 1);
                                
                                -- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM

SELECT		d.department_id, d.department_name, p.position_name, COUNT(p.position_id)
FROM		departments d
INNER JOIN	`accounts` a 
ON			d.department_id=a.department_id
INNER JOIN	positions p 
ON			p.position_id=a.position_id
GROUP BY	d.department_id, p.position_id;

-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...

SELECT		q.question_id, tq.type_name, cq.category_name, q.content, q.type_id, q.creator_id, a.full_name, an.answer_id, an.content
FROM		answers an 
INNER JOIN	questions q			ON q.question_id=an.question_id
INNER JOIN	`accounts` a		ON a.account_id=q.creator_id
INNER JOIN	type_questions tq	ON tq.type_id=q.type_id
INNER JOIN	category_questions cq ON cq.category_id=q.category_id;

-- Question 13. Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm 
SELECT	tn.type_name,	
		COUNT(q.type_id) 'so cau hoi'
FROM	questions q
LEFT JOIN	type_questions tn
ON	q.type_id = tn.type_id
GROUP BY	tn.type_name;

-- Question 14.Lấy ra group không có account nào 
SELECT	g.group_name
FROM	`groups` g
LEFT JOIN	group_accounts ga
ON	g.group_id = ga.group_id
WHERE	ga.group_id IS NULL;

-- Question 16. Lấy ra question không có answer nào 
SELECT	q.content
FROM	questions q
LEFT JOIN	answers a
ON	q.question_id = a.question_id
WHERE	a.question_id IS NULL;

-- Question 17.  a)	Lấy các account thuộc group_id = 1 
-- 				 b)	Lấy các account thuộc group_id = 2 
-- 				 c)	Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau 
SELECT	a.account_id
FROM	`accounts` a
LEFT JOIN	group_accounts ga
ON	a.account_id = ga.account_id
WHERE	ga.group_id = 1
UNION
SELECT	a.account_id
FROM	`accounts` a
LEFT JOIN	group_accounts ga
ON	a.account_id = ga.account_id
WHERE	ga.group_id = 3;

-- Question 18.  a)	Lấy các group có lớn hơn 5 thành viên 
-- 				 b)	Lấy các group có nhỏ hơn 7 thành viên 
-- 				 c)	Ghép 2 kết quả từ câu a) và câu b) 
SELECT	g.group_name,
		COUNT(ga.group_id) 'so luong nhan vien'
FROM	group_accounts ga
LEFT JOIN	`groups` g
ON	g.group_id = ga.group_id
GROUP BY g.group_name
	HAVING	COUNT(ga.group_id) >= 2
UNION ALL
SELECT	g.group_name,
		COUNT(ga.group_id) 'so luong nhan vien'
FROM	group_accounts ga
LEFT JOIN	`groups` g
ON	g.group_id = ga.group_id
GROUP BY g.group_name
	HAVING	COUNT(ga.group_id) < 5;
    
    
    
