-- ============================================================
-- SEED DATA FOR STORE 1 (db_store1)
-- ============================================================
USE db_store1;

-- CUSTOMERS (100)
INSERT INTO customers (name, phone, is_regular, email) VALUES
('Arjun Kumar','9876543210',1,'arjun@email.com'),('Priya Sharma','9876543211',1,'priya@email.com'),
('Ravi Patel','9876543212',0,'ravi@email.com'),('Sunita Devi','9876543213',1,'sunita@email.com'),
('Mohan Lal','9876543214',0,'mohan@email.com'),('Lakshmi Iyer','9876543215',1,'lakshmi@email.com'),
('Vikram Singh','9876543216',1,'vikram@email.com'),('Kavitha Nair','9876543217',0,'kavitha@email.com'),
('Suresh Babu','9876543218',1,'suresh@email.com'),('Anita Joshi','9876543219',0,'anita@email.com'),
('Deepak Verma','9876543220',1,'deepak@email.com'),('Meena Gupta','9876543221',1,'meena@email.com'),
('Rajesh Khanna','9876543222',0,'rajesh@email.com'),('Pooja Mishra','9876543223',1,'pooja@email.com'),
('Anil Aggarwal','9876543224',0,'anil@email.com'),('Shalini Rao','9876543225',1,'shalini@email.com'),
('Vijay Menon','9876543226',1,'vijay@email.com'),('Rekha Chandra','9876543227',0,'rekha@email.com'),
('Ashok Pillai','9876543228',1,'ashok@email.com'),('Usha Reddy','9876543229',0,'usha@email.com'),
('Manoj Tiwari','9876543230',1,'manoj@email.com'),('Geeta Sinha','9876543231',0,'geeta@email.com'),
('Santosh Yadav','9876543232',1,'santosh@email.com'),('Kaveri Naidu','9876543233',1,'kaveri@email.com'),
('Balram Shukla','9876543234',0,'balram@email.com'),('Neha Jain','9876543235',1,'neha@email.com'),
('Ganesh Patil','9876543236',0,'ganesh@email.com'),('Vasudha Kulkarni','9876543237',1,'vasudha@email.com'),
('Harish Mehta','9876543238',1,'harish@email.com'),('Sarla Tripathi','9876543239',0,'sarla@email.com'),
('Dinesh Bhat','9876543240',1,'dinesh@email.com'),('Indira Nambiar','9876543241',0,'indira@email.com'),
('Mahesh Dubey','9876543242',1,'mahesh@email.com'),('Shobha Pandey','9876543243',1,'shobha@email.com'),
('Ramesh Chaudhary','9876543244',0,'ramesh@email.com'),('Asha Boro','9876543245',1,'asha@email.com'),
('Sunil Chauhan','9876543246',1,'sunil@email.com'),('Kamla Devi','9876543247',0,'kamla@email.com'),
('Prakash Hegde','9876543248',1,'prakash@email.com'),('Sumitra Bose','9876543249',0,'sumitra@email.com'),
('Girish Nair','9876543250',1,'girish@email.com'),('Pushpa Shetty','9876543251',1,'pushpa@email.com'),
('Naresh Pillai','9876543252',0,'naresh@email.com'),('Shanta Rajan','9876543253',1,'shanta@email.com'),
('Hemant Joshi','9876543254',1,'hemant@email.com'),('Meera Krishnan','9876543255',0,'meera@email.com'),
('Kishor Patel','9876543256',1,'kishor@email.com'),('Lata Sharma','9876543257',0,'lata@email.com'),
('Yogesh Kadam','9876543258',1,'yogesh@email.com'),('Savita Pawar','9876543259',1,'savita@email.com'),
('Dilip Sawant','9876543260',0,'dilip@email.com'),('Jyoti Bhatt','9876543261',1,'jyoti@email.com'),
('Pramod Kulkarni','9876543262',1,'pramod@email.com'),('Shweta Agarwal','9876543263',0,'shweta@email.com'),
('Vinod Patel','9876543264',1,'vinod@email.com'),('Bharti Singh','9876543265',0,'bharti@email.com'),
('Lalit Sharma','9876543266',1,'lalit@email.com'),('Reena Kapoor','9876543267',1,'reena@email.com'),
('Rakesh Malhotra','9876543268',0,'rakesh@email.com'),('Sunena Bansal','9876543269',1,'sunena@email.com'),
('Ajay Rathore','9876543270',1,'ajay@email.com'),('Smita Wagh','9876543271',0,'smita@email.com'),
('Abhijit Deshpande','9876543272',1,'abhijit@email.com'),('Vandana Thakur','9876543273',1,'vandana@email.com'),
('Ranjit Kaur','9876543274',0,'ranjit@email.com'),('Manohar Rao','9876543275',1,'manohar@email.com'),
('Savitri Nayak','9876543276',0,'savitri@email.com'),('Prakash Kumar','9876543277',1,'prakash2@email.com'),
('Anjali Misra','9876543278',1,'anjali@email.com'),('Ashwin Narayan','9876543279',0,'ashwin@email.com'),
('Tara Menon','9876543280',1,'tara@email.com'),('Bhanu Prasad','9876543281',0,'bhanu@email.com'),
('Vidya Rao','9876543282',1,'vidya@email.com'),('Chandan Singh','9876543283',1,'chandan@email.com'),
('Sundar Pillai','9876543284',0,'sundar@email.com'),('Manju Bhat','9876543285',1,'manju@email.com'),
('Naveen Kumar','9876543286',1,'naveen@email.com'),('Padma Devi','9876543287',0,'padma@email.com'),
('Sanjay Gupta','9876543288',1,'sanjay@email.com'),('Nalini Chakraborty','9876543289',1,'nalini@email.com'),
('Rohit Verma','9876543290',0,'rohit@email.com'),('Priti Jha','9876543291',1,'priti@email.com'),
('Kiran Rao','9876543292',1,'kiran@email.com'),('Gauri Desai','9876543293',0,'gauri@email.com'),
('Harsha Vardhan','9876543294',1,'harsha@email.com'),('Leela Nambiar','9876543295',1,'leela@email.com'),
('Mohan Das','9876543296',0,'mohanda@email.com'),('Sujatha Iyer','9876543297',1,'sujatha@email.com'),
('Arun Pillai','9876543298',1,'arun@email.com'),('Geetha Reddy','9876543299',0,'geetha@email.com'),
('Vivek Krishnamurthy','9876543300',1,'vivek@email.com'),('Saranya Sundaram','9876543301',1,'saranya@email.com'),
('Ramamoorthy Pillai','9876543302',0,'rama@email.com'),('Devi Prasad','9876543303',1,'devi@email.com'),
('Sriram Nair','9876543304',1,'sriram@email.com'),('Uma Maheshwari','9876543305',0,'uma@email.com'),
('Balaji Venkataraman','9876543306',1,'balaji@email.com'),('Chandrika Pillai','9876543307',0,'chandrika@email.com');

-- PRODUCTS STORE 1 (90 products)
INSERT INTO products (name, category, price, cost_price, stock, expiry_date, store_id) VALUES
-- Vegetables (10)
('Tomato','Vegetables',30,18,150,DATE_ADD(CURDATE(),INTERVAL 5 DAY),1),
('Potato','Vegetables',25,15,200,DATE_ADD(CURDATE(),INTERVAL 10 DAY),1),
('Onion','Vegetables',35,20,180,DATE_ADD(CURDATE(),INTERVAL 8 DAY),1),
('Cabbage','Vegetables',28,16,80,DATE_ADD(CURDATE(),INTERVAL 4 DAY),1),
('Carrot','Vegetables',40,24,120,DATE_ADD(CURDATE(),INTERVAL 7 DAY),1),
('Spinach','Vegetables',20,12,60,DATE_ADD(CURDATE(),INTERVAL 2 DAY),1),
('Brinjal','Vegetables',22,13,90,DATE_ADD(CURDATE(),INTERVAL 6 DAY),1),
('Cauliflower','Vegetables',45,27,70,DATE_ADD(CURDATE(),INTERVAL 3 DAY),1),
('Beans','Vegetables',50,30,40,DATE_ADD(CURDATE(),INTERVAL 5 DAY),1),
('Bitter Gourd','Vegetables',38,22,55,DATE_ADD(CURDATE(),INTERVAL 6 DAY),1),
-- Fruits (10)
('Banana','Fruits',40,24,300,DATE_ADD(CURDATE(),INTERVAL 5 DAY),1),
('Apple','Fruits',150,90,120,DATE_ADD(CURDATE(),INTERVAL 14 DAY),1),
('Mango','Fruits',80,48,200,DATE_ADD(CURDATE(),INTERVAL 7 DAY),1),
('Orange','Fruits',60,36,150,DATE_ADD(CURDATE(),INTERVAL 10 DAY),1),
('Grapes','Fruits',90,54,80,DATE_ADD(CURDATE(),INTERVAL 5 DAY),1),
('Watermelon','Fruits',30,18,40,DATE_ADD(CURDATE(),INTERVAL 8 DAY),1),
('Papaya','Fruits',35,21,60,DATE_ADD(CURDATE(),INTERVAL 3 DAY),1),
('Guava','Fruits',45,27,90,DATE_ADD(CURDATE(),INTERVAL 6 DAY),1),
('Pomegranate','Fruits',120,72,50,DATE_ADD(CURDATE(),INTERVAL 12 DAY),1),
('Pineapple','Fruits',55,33,35,DATE_ADD(CURDATE(),INTERVAL 7 DAY),1),
-- Grocery (10)
('Basmati Rice 5kg','Grocery',450,270,80,DATE_ADD(CURDATE(),INTERVAL 365 DAY),1),
('Wheat Flour 10kg','Grocery',380,228,60,DATE_ADD(CURDATE(),INTERVAL 180 DAY),1),
('Toor Dal 1kg','Grocery',130,78,100,DATE_ADD(CURDATE(),INTERVAL 180 DAY),1),
('Moong Dal 1kg','Grocery',120,72,90,DATE_ADD(CURDATE(),INTERVAL 180 DAY),1),
('Mustard Oil 1L','Grocery',180,108,70,DATE_ADD(CURDATE(),INTERVAL 365 DAY),1),
('Turmeric Powder 200g','Grocery',55,33,120,DATE_ADD(CURDATE(),INTERVAL 365 DAY),1),
('Red Chilli Powder 200g','Grocery',65,39,110,DATE_ADD(CURDATE(),INTERVAL 365 DAY),1),
('Coriander Powder 200g','Grocery',48,29,130,DATE_ADD(CURDATE(),INTERVAL 365 DAY),1),
('Salt 1kg','Grocery',22,13,200,DATE_ADD(CURDATE(),INTERVAL 730 DAY),1),
('Sugar 1kg','Grocery',45,27,150,DATE_ADD(CURDATE(),INTERVAL 365 DAY),1),
-- Dairy (10)
('Milk 1L','Dairy',55,33,200,DATE_ADD(CURDATE(),INTERVAL 2 DAY),1),
('Curd 500g','Dairy',35,21,150,DATE_ADD(CURDATE(),INTERVAL 3 DAY),1),
('Butter 100g','Dairy',55,33,80,DATE_ADD(CURDATE(),INTERVAL 30 DAY),1),
('Paneer 200g','Dairy',90,54,60,DATE_ADD(CURDATE(),INTERVAL 4 DAY),1),
('Cheese Slice 200g','Dairy',130,78,40,DATE_ADD(CURDATE(),INTERVAL 60 DAY),1),
('Ghee 500ml','Dairy',350,210,50,DATE_ADD(CURDATE(),INTERVAL 365 DAY),1),
('Lassi 300ml','Dairy',30,18,100,DATE_ADD(CURDATE(),INTERVAL 2 DAY),1),
('Skimmed Milk 1L','Dairy',58,35,70,DATE_ADD(CURDATE(),INTERVAL 2 DAY),1),
('Full Cream Milk 500ml','Dairy',32,19,120,DATE_ADD(CURDATE(),INTERVAL 2 DAY),1),
('Cream 200ml','Dairy',75,45,45,DATE_ADD(CURDATE(),INTERVAL 14 DAY),1),
-- Personal Care (10)
('Colgate Toothpaste 200g','Personal Care',95,57,80,DATE_ADD(CURDATE(),INTERVAL 730 DAY),1),
('Dove Soap 75g','Personal Care',45,27,120,DATE_ADD(CURDATE(),INTERVAL 730 DAY),1),
('Pantene Shampoo 200ml','Personal Care',185,111,50,DATE_ADD(CURDATE(),INTERVAL 730 DAY),1),
('Dettol Handwash 250ml','Personal Care',99,59,90,DATE_ADD(CURDATE(),INTERVAL 730 DAY),1),
('Whisper Pads Pack','Personal Care',75,45,60,DATE_ADD(CURDATE(),INTERVAL 730 DAY),1),
('Vaseline Lotion 200ml','Personal Care',145,87,40,DATE_ADD(CURDATE(),INTERVAL 730 DAY),1),
('Gillette Razor 2pk','Personal Care',89,53,70,DATE_ADD(CURDATE(),INTERVAL 730 DAY),1),
('Head & Shoulders 200ml','Personal Care',195,117,45,DATE_ADD(CURDATE(),INTERVAL 730 DAY),1),
('Nivea Cream 50ml','Personal Care',110,66,55,DATE_ADD(CURDATE(),INTERVAL 730 DAY),1),
('Listerine 250ml','Personal Care',175,105,35,DATE_ADD(CURDATE(),INTERVAL 730 DAY),1),
-- Beverages (10)
('Coca-Cola 750ml','Beverages',45,27,200,DATE_ADD(CURDATE(),INTERVAL 180 DAY),1),
('Pepsi 750ml','Beverages',42,25,180,DATE_ADD(CURDATE(),INTERVAL 180 DAY),1),
('Sprite 750ml','Beverages',44,26,160,DATE_ADD(CURDATE(),INTERVAL 180 DAY),1),
('Frooti 200ml','Beverages',20,12,250,DATE_ADD(CURDATE(),INTERVAL 180 DAY),1),
('Maaza 250ml','Beverages',22,13,220,DATE_ADD(CURDATE(),INTERVAL 180 DAY),1),
('Red Bull 250ml','Beverages',125,75,80,DATE_ADD(CURDATE(),INTERVAL 365 DAY),1),
('Bisleri 1L','Beverages',20,12,300,DATE_ADD(CURDATE(),INTERVAL 365 DAY),1),
('Nescafe 50g','Beverages',200,120,60,DATE_ADD(CURDATE(),INTERVAL 365 DAY),1),
('Tata Tea 250g','Beverages',155,93,90,DATE_ADD(CURDATE(),INTERVAL 365 DAY),1),
('Lipton Green Tea 25bags','Beverages',140,84,50,DATE_ADD(CURDATE(),INTERVAL 730 DAY),1),
-- Snacks (10)
('Lays Chips 75g','Snacks',20,12,300,DATE_ADD(CURDATE(),INTERVAL 90 DAY),1),
('Kurkure 65g','Snacks',20,12,280,DATE_ADD(CURDATE(),INTERVAL 90 DAY),1),
('Biscoff Cookies 150g','Snacks',55,33,80,DATE_ADD(CURDATE(),INTERVAL 180 DAY),1),
('Britannia Good Day 150g','Snacks',35,21,200,DATE_ADD(CURDATE(),INTERVAL 180 DAY),1),
('Parle G 200g','Snacks',25,15,250,DATE_ADD(CURDATE(),INTERVAL 180 DAY),1),
('Haldiram Bhujia 200g','Snacks',75,45,120,DATE_ADD(CURDATE(),INTERVAL 180 DAY),1),
('Cashews 250g','Snacks',220,132,40,DATE_ADD(CURDATE(),INTERVAL 180 DAY),1),
('Almonds 250g','Snacks',280,168,35,DATE_ADD(CURDATE(),INTERVAL 365 DAY),1),
('Pringles 165g','Snacks',175,105,60,DATE_ADD(CURDATE(),INTERVAL 90 DAY),1),
('Digestive Biscuits 400g','Snacks',95,57,90,DATE_ADD(CURDATE(),INTERVAL 180 DAY),1),
-- Household (10)
('Surf Excel 2kg','Household',290,174,60,DATE_ADD(CURDATE(),INTERVAL 730 DAY),1),
('Ariel 1kg','Household',220,132,70,DATE_ADD(CURDATE(),INTERVAL 730 DAY),1),
('Vim Dish Wash 750ml','Household',95,57,80,DATE_ADD(CURDATE(),INTERVAL 730 DAY),1),
('Harpic Toilet Cleaner','Household',110,66,50,DATE_ADD(CURDATE(),INTERVAL 730 DAY),1),
('Colin Glass Cleaner','Household',135,81,40,DATE_ADD(CURDATE(),INTERVAL 730 DAY),1),
('Mosquito Repellent Coil','Household',55,33,100,DATE_ADD(CURDATE(),INTERVAL 365 DAY),1),
('Hit Cockroach Spray','Household',210,126,45,DATE_ADD(CURDATE(),INTERVAL 365 DAY),1),
('Room Freshener 250ml','Household',195,117,35,DATE_ADD(CURDATE(),INTERVAL 365 DAY),1),
('Floor Cleaner 1L','Household',89,53,60,DATE_ADD(CURDATE(),INTERVAL 730 DAY),1),
('Toilet Paper 6 Rolls','Household',150,90,55,DATE_ADD(CURDATE(),INTERVAL 730 DAY),1),
-- Frozen (5)
('Frozen Peas 500g','Frozen',65,39,80,DATE_ADD(CURDATE(),INTERVAL 90 DAY),1),
('Frozen Pizza','Frozen',250,150,30,DATE_ADD(CURDATE(),INTERVAL 60 DAY),1),
('Ice Cream 500ml','Frozen',180,108,40,DATE_ADD(CURDATE(),INTERVAL 60 DAY),1),
('Frozen Corn 500g','Frozen',75,45,50,DATE_ADD(CURDATE(),INTERVAL 90 DAY),1),
('Frozen Shrimp 250g','Frozen',320,192,25,DATE_ADD(CURDATE(),INTERVAL 60 DAY),1),
-- Packaged Food (5)
('Maggi Noodles 70g','Packaged Food',14,8,500,DATE_ADD(CURDATE(),INTERVAL 365 DAY),1),
('Yippee Noodles 70g','Packaged Food',12,7,400,DATE_ADD(CURDATE(),INTERVAL 365 DAY),1),
('Knorr Soup 45g','Packaged Food',35,21,150,DATE_ADD(CURDATE(),INTERVAL 365 DAY),1),
('Heinz Ketchup 500g','Packaged Food',185,111,60,DATE_ADD(CURDATE(),INTERVAL 365 DAY),1),
('Soya Chunks 200g','Packaged Food',45,27,100,DATE_ADD(CURDATE(),INTERVAL 365 DAY),1);

-- WORKERS STORE 1 (25)
INSERT INTO workers (name, phone, role, store_id, salary, hire_date) VALUES
('Rajan Kumar','9111111101','Store Manager',1,35000,'2020-01-15'),
('Premi Singh','9111111102','Cashier',1,18000,'2020-03-10'),
('Dinesh Rao','9111111103','Stock Manager',1,22000,'2019-11-20'),
('Leela Krishnan','9111111104','Sales Executive',1,16000,'2021-02-14'),
('Muthukumar P','9111111105','Security Guard',1,14000,'2020-07-01'),
('Saraswathi V','9111111106','Cashier',1,18000,'2021-05-22'),
('Abdul Hameed','9111111107','Delivery Boy',1,15000,'2022-01-10'),
('Bhuvana S','9111111108','Customer Service',1,17000,'2021-08-30'),
('Tamilselvan K','9111111109','Stock Manager',1,21000,'2020-04-15'),
('Indira Gandhi A','9111111110','Sales Executive',1,16500,'2022-03-20'),
('Murugesan P','9111111111','Janitor',1,12000,'2019-06-15'),
('Kavitha R','9111111112','Billing Executive',1,17500,'2021-09-10'),
('Selvam D','9111111113','Security Guard',1,14000,'2020-12-01'),
('Radha K','9111111114','Customer Service',1,16000,'2022-06-15'),
('Senthil Kumar M','9111111115','Delivery Boy',1,15500,'2021-11-25'),
('Anandhi S','9111111116','Sales Executive',1,16000,'2023-01-10'),
('Vignesh R','9111111117','Stock Manager',1,21000,'2020-08-20'),
('Malliga P','9111111118','Cashier',1,18000,'2021-04-05'),
('Karthikeyan V','9111111119','Store Supervisor',1,27000,'2019-03-12'),
('Devi M','9111111120','Sales Executive',1,16000,'2022-09-15'),
('Balamurugan S','9111111121','Delivery Boy',1,15000,'2023-03-01'),
('Gomathi A','9111111122','Cashier',1,18000,'2020-10-20'),
('Rajkumar T','9111111123','Security Guard',1,14500,'2021-07-15'),
('Vidya L','9111111124','Customer Service',1,16500,'2022-11-10'),
('Santhanam KR','9111111125','Janitor',1,12000,'2020-05-22');

-- ATTENDANCE for workers 1-25 last 30 days
INSERT INTO attendance (worker_id, date, status)
SELECT w.id, DATE_SUB(CURDATE(), INTERVAL n DAY),
  CASE WHEN RAND() < 0.85 THEN 'present' WHEN RAND() < 0.5 THEN 'absent' ELSE 'leave' END
FROM workers w
CROSS JOIN (
  SELECT 0 AS n UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5
  UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10
  UNION SELECT 11 UNION SELECT 12 UNION SELECT 13 UNION SELECT 14 UNION SELECT 15
  UNION SELECT 16 UNION SELECT 17 UNION SELECT 18 UNION SELECT 19 UNION SELECT 20
  UNION SELECT 21 UNION SELECT 22 UNION SELECT 23 UNION SELECT 24 UNION SELECT 25
  UNION SELECT 26 UNION SELECT 27 UNION SELECT 28 UNION SELECT 29
) AS days
WHERE w.store_id = 1;

-- SALARIES STORE 1
INSERT INTO salaries (worker_id, store_id, basic_salary, bonus, total_salary, month, paid_date)
SELECT id, 1, salary, ROUND(salary*0.1,0), ROUND(salary*1.1,0), 'March-2025', '2025-03-31'
FROM workers WHERE store_id=1;

INSERT INTO salaries (worker_id, store_id, basic_salary, bonus, total_salary, month, paid_date)
SELECT id, 1, salary, ROUND(salary*0.08,0), ROUND(salary*1.08,0), 'April-2025', '2025-04-30'
FROM workers WHERE store_id=1;

-- ORDERS STORE 1 (300 orders)
INSERT INTO orders (customer_id, total_amount, order_type, order_date)
SELECT 
  FLOOR(RAND()*100)+1,
  ROUND(RAND()*2000+100, 2),
  CASE WHEN RAND()<0.6 THEN 'store' ELSE 'online' END,
  DATE_SUB(NOW(), INTERVAL FLOOR(RAND()*60) DAY)
FROM (
  SELECT a.N + b.N*10 + c.N*100 + 1 n FROM 
  (SELECT 0 AS N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) a,
  (SELECT 0 AS N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) b,
  (SELECT 0 AS N UNION SELECT 1 UNION SELECT 2) c
) AS nums WHERE n <= 300;

-- ORDER ITEMS STORE 1
INSERT INTO order_items (order_id, product_id, quantity, unit_price)
SELECT 
  o.id,
  FLOOR(RAND()*90)+1,
  FLOOR(RAND()*5)+1,
  p.price
FROM orders o
JOIN products p ON p.id = FLOOR(RAND()*90)+1
LIMIT 900;

-- ADVERTISEMENTS STORE 1
INSERT INTO advertisements (store_id, type, amount, month, date, platform, impressions, conversions) VALUES
(1,'Social Media',25000,'January-2025','2025-01-05','Facebook',45000,1200),
(1,'Google Ads',35000,'January-2025','2025-01-10','Google',72000,2100),
(1,'Banner',8000,'January-2025','2025-01-15','Local',5000,300),
(1,'Social Media',28000,'February-2025','2025-02-05','Instagram',52000,1500),
(1,'Google Ads',40000,'February-2025','2025-02-12','Google',80000,2400),
(1,'SMS Campaign',12000,'February-2025','2025-02-20','SMS',15000,800),
(1,'Social Media',30000,'March-2025','2025-03-05','Facebook',58000,1800),
(1,'Google Ads',42000,'March-2025','2025-03-10','Google',85000,2600),
(1,'YouTube Ads',22000,'March-2025','2025-03-20','YouTube',120000,3200),
(1,'Social Media',32000,'April-2025','2025-04-05','Instagram',62000,2000);

-- LOANS STORE 1
INSERT INTO loans (store_id, total_loan, interest_rate, emi_amount, remaining_balance, start_date, end_date, lender) VALUES
(1,500000,12.5,9500,420000,'2023-01-01','2027-01-01','SBI Bank'),
(1,200000,10.0,4800,150000,'2024-01-01','2026-01-01','HDFC Bank');

-- LOAN PAYMENTS STORE 1
INSERT INTO loan_payments (loan_id, store_id, amount_paid, payment_date, month) VALUES
(1,1,9500,'2025-01-05','January-2025'),(1,1,9500,'2025-02-05','February-2025'),
(1,1,9500,'2025-03-05','March-2025'),(1,1,9500,'2025-04-05','April-2025'),
(2,1,4800,'2025-01-05','January-2025'),(2,1,4800,'2025-02-05','February-2025'),
(2,1,4800,'2025-03-05','March-2025'),(2,1,4800,'2025-04-05','April-2025');

-- ============================================================
-- SEED DATA FOR STORE 2 (db_store2)
-- ============================================================
USE db_store2;

-- CUSTOMERS (105)
INSERT INTO customers (name, phone, is_regular, email) VALUES
('Ramesh Nair','9877001001',1,'ramesh.n@email.com'),('Sunita Pillai','9877001002',1,'sunita.p@email.com'),
('Chandran K','9877001003',0,'chandran@email.com'),('Vimala Devi','9877001004',1,'vimala@email.com'),
('Subramaniam R','9877001005',1,'subra@email.com'),('Meenakshi T','9877001006',0,'meenakshi@email.com'),
('Baskaran P','9877001007',1,'baskaran@email.com'),('Saroja Bai','9877001008',1,'saroja@email.com'),
('Murugan D','9877001009',0,'murugan@email.com'),('Padmavathi G','9877001010',1,'padma@email.com'),
('Natarajan S','9877001011',1,'natarajan@email.com'),('Kamakshi V','9877001012',0,'kamakshi@email.com'),
('Palaniswamy A','9877001013',1,'palani@email.com'),('Sumathy R','9877001014',1,'sumathy@email.com'),
('Krishnaswamy B','9877001015',0,'krishna@email.com'),('Chellamma N','9877001016',1,'chellamma@email.com'),
('Venugopal K','9877001017',1,'venu@email.com'),('Lakshmibai P','9877001018',0,'lakshmibai@email.com'),
('Soundarapandian','9877001019',1,'soundar@email.com'),('Parvathi S','9877001020',1,'parvathi@email.com'),
('Arumugam T','9877001021',0,'arumugam@email.com'),('Vasantha K','9877001022',1,'vasantha@email.com'),
('Periyasamy M','9877001023',1,'periyasamy@email.com'),('Kalaiyarasi N','9877001024',0,'kalaiyarasi@email.com'),
('Thilageswari P','9877001025',1,'thilaga@email.com'),('Ramasamy K','9877001026',0,'ramasamy@email.com'),
('Angammal V','9877001027',1,'angammal@email.com'),('Chinnathambi S','9877001028',1,'chinna@email.com'),
('Maheswari R','9877001029',0,'maheswari@email.com'),('Karunanidhi P','9877001030',1,'karuna@email.com'),
('Sivakami T','9877001031',1,'sivakami@email.com'),('Gunaraj D','9877001032',0,'gunaraj@email.com'),
('Ashokan K','9877001033',1,'ashokan@email.com'),('Bhavani S','9877001034',1,'bhavani@email.com'),
('Radhakrishnan M','9877001035',0,'radhak@email.com'),('Thangamani V','9877001036',1,'thanga@email.com'),
('Kumaraswamy P','9877001037',1,'kumara@email.com'),('Saraswathi T','9877001038',0,'saraswathi@email.com'),
('Govindasamy K','9877001039',1,'govinda@email.com'),('Valarmathi R','9877001040',1,'valar@email.com'),
('Sethuraman D','9877001041',0,'sethuram@email.com'),('Thamarai S','9877001042',1,'thamarai@email.com'),
('Muthusamy K','9877001043',1,'muthusamy@email.com'),('Umarani V','9877001044',0,'umarani@email.com'),
('Perumal T','9877001045',1,'perumal@email.com'),('Nirmala S','9877001046',1,'nirmala@email.com'),
('Selvaraj K','9877001047',0,'selvaraj@email.com'),('Kamala P','9877001048',1,'kamala@email.com'),
('Raman D','9877001049',1,'raman@email.com'),('Komalavalli T','9877001050',0,'komalavalli@email.com'),
('Annamalai K','9877001051',1,'annamalai@email.com'),('Rukmani S','9877001052',1,'rukmani@email.com'),
('Ponnusamy V','9877001053',0,'ponnus@email.com'),('Karpagam T','9877001054',1,'karpagam@email.com'),
('Suresh M','9877001055',1,'suresh.m@email.com'),('Abirami K','9877001056',0,'abirami@email.com'),
('Thirumalai P','9877001057',1,'thirumalai@email.com'),('Maragatham S','9877001058',1,'maragatham@email.com'),
('Mangalam D','9877001059',0,'mangalam@email.com'),('Kannan R','9877001060',1,'kannan@email.com'),
('Deivam K','9877001061',1,'deivam@email.com'),('Poongodi S','9877001062',0,'poongodi@email.com'),
('Sabari V','9877001063',1,'sabari@email.com'),('Ilakiya T','9877001064',1,'ilakiya@email.com'),
('Velan K','9877001065',0,'velan@email.com'),('Malarvizhi P','9877001066',1,'malar@email.com'),
('Senthil S','9877001067',1,'senthil.s@email.com'),('Sudha R','9877001068',0,'sudha@email.com'),
('Elumalai D','9877001069',1,'eluma@email.com'),('Punitha K','9877001070',1,'punitha@email.com'),
('Barathi M','9877001071',0,'barathi@email.com'),('Jaya S','9877001072',1,'jaya@email.com'),
('Ramamoorthy K','9877001073',1,'ramamoorthy@email.com'),('Nalini P','9877001074',0,'nalini@email.com'),
('Devanayaki V','9877001075',1,'devanayaki@email.com'),('Chidambaram S','9877001076',1,'chidambaram@email.com'),
('Alagarsamy K','9877001077',0,'alagarsamy@email.com'),('Thangathambi R','9877001078',1,'thangat@email.com'),
('Velmurugan D','9877001079',1,'velmurugan@email.com'),('Parimalam S','9877001080',0,'parimalam@email.com'),
('Jayaraman K','9877001081',1,'jayaraman@email.com'),('Rani V','9877001082',1,'rani@email.com'),
('Krishnan T','9877001083',0,'krishnan.t@email.com'),('Sundari P','9877001084',1,'sundari@email.com'),
('Ganesan S','9877001085',1,'ganesan.s@email.com'),('Pavithra K','9877001086',0,'pavithra@email.com'),
('Manickam R','9877001087',1,'manickam@email.com'),('Rajalakshmi D','9877001088',1,'rajalakshmi@email.com'),
('Sasikumar V','9877001089',0,'sasikumar@email.com'),('Valli T','9877001090',1,'valli@email.com'),
('Anbarasan K','9877001091',1,'anbarasan@email.com'),('Thirumathi S','9877001092',0,'thirumathi@email.com'),
('Sivakumar P','9877001093',1,'sivakumar@email.com'),('Komathi R','9877001094',1,'komathi@email.com'),
('Babu D','9877001095',0,'babu.d@email.com'),('Saranya R','9877001096',1,'saranya.r@email.com'),
('Murugeswari S','9877001097',1,'murugeswari@email.com'),('Rathika K','9877001098',0,'rathika@email.com'),
('Durai P','9877001099',1,'durai@email.com'),('Vijayalakshmi S','9877001100',1,'vijayalakshmi@email.com'),
('Palanisamy R','9877001101',0,'palanisamy@email.com'),('Chitra K','9877001102',1,'chitra@email.com'),
('Marimuthu D','9877001103',1,'marimuthu@email.com'),('Gowri S','9877001104',0,'gowri@email.com'),
('Thiyagarajan V','9877001105',1,'thiyagarajan@email.com');

-- PRODUCTS STORE 2 (90 products - different stock levels)
INSERT INTO products (name, category, price, cost_price, stock, expiry_date, store_id) VALUES
-- Vegetables (10)
('Tomato','Vegetables',32,19,80,DATE_ADD(CURDATE(),INTERVAL 4 DAY),2),
('Potato','Vegetables',28,17,120,DATE_ADD(CURDATE(),INTERVAL 12 DAY),2),
('Onion','Vegetables',38,23,90,DATE_ADD(CURDATE(),INTERVAL 6 DAY),2),
('Cabbage','Vegetables',30,18,3,DATE_ADD(CURDATE(),INTERVAL 3 DAY),2),
('Carrot','Vegetables',42,25,60,DATE_ADD(CURDATE(),INTERVAL 9 DAY),2),
('Spinach','Vegetables',22,13,2,DATE_ADD(CURDATE(),INTERVAL 1 DAY),2),
('Brinjal','Vegetables',25,15,70,DATE_ADD(CURDATE(),INTERVAL 7 DAY),2),
('Cauliflower','Vegetables',48,29,35,DATE_ADD(CURDATE(),INTERVAL 2 DAY),2),
('Beans','Vegetables',52,31,20,DATE_ADD(CURDATE(),INTERVAL 4 DAY),2),
('Bitter Gourd','Vegetables',40,24,45,DATE_ADD(CURDATE(),INTERVAL 5 DAY),2),
-- Fruits (10)
('Banana','Fruits',42,25,250,DATE_ADD(CURDATE(),INTERVAL 4 DAY),2),
('Apple','Fruits',155,93,90,DATE_ADD(CURDATE(),INTERVAL 12 DAY),2),
('Mango','Fruits',85,51,4,DATE_ADD(CURDATE(),INTERVAL 6 DAY),2),
('Orange','Fruits',65,39,110,DATE_ADD(CURDATE(),INTERVAL 9 DAY),2),
('Grapes','Fruits',95,57,55,DATE_ADD(CURDATE(),INTERVAL 4 DAY),2),
('Watermelon','Fruits',32,19,25,DATE_ADD(CURDATE(),INTERVAL 7 DAY),2),
('Papaya','Fruits',38,23,40,DATE_ADD(CURDATE(),INTERVAL 2 DAY),2),
('Guava','Fruits',48,29,65,DATE_ADD(CURDATE(),INTERVAL 5 DAY),2),
('Pomegranate','Fruits',125,75,30,DATE_ADD(CURDATE(),INTERVAL 11 DAY),2),
('Pineapple','Fruits',58,35,20,DATE_ADD(CURDATE(),INTERVAL 6 DAY),2),
-- Grocery (10)
('Basmati Rice 5kg','Grocery',460,276,50,DATE_ADD(CURDATE(),INTERVAL 365 DAY),2),
('Wheat Flour 10kg','Grocery',390,234,40,DATE_ADD(CURDATE(),INTERVAL 180 DAY),2),
('Toor Dal 1kg','Grocery',135,81,70,DATE_ADD(CURDATE(),INTERVAL 180 DAY),2),
('Moong Dal 1kg','Grocery',125,75,60,DATE_ADD(CURDATE(),INTERVAL 180 DAY),2),
('Sunflower Oil 1L','Grocery',165,99,80,DATE_ADD(CURDATE(),INTERVAL 365 DAY),2),
('Turmeric Powder 200g','Grocery',58,35,90,DATE_ADD(CURDATE(),INTERVAL 365 DAY),2),
('Red Chilli Powder 200g','Grocery',68,41,80,DATE_ADD(CURDATE(),INTERVAL 365 DAY),2),
('Garam Masala 100g','Grocery',75,45,100,DATE_ADD(CURDATE(),INTERVAL 365 DAY),2),
('Salt 1kg','Grocery',24,14,150,DATE_ADD(CURDATE(),INTERVAL 730 DAY),2),
('Jaggery 500g','Grocery',55,33,120,DATE_ADD(CURDATE(),INTERVAL 365 DAY),2),
-- Dairy (10)
('Milk 1L','Dairy',58,35,180,DATE_ADD(CURDATE(),INTERVAL 2 DAY),2),
('Curd 500g','Dairy',38,23,120,DATE_ADD(CURDATE(),INTERVAL 3 DAY),2),
('Butter 100g','Dairy',58,35,60,DATE_ADD(CURDATE(),INTERVAL 30 DAY),2),
('Paneer 200g','Dairy',95,57,2,DATE_ADD(CURDATE(),INTERVAL 3 DAY),2),
('Cheese Slice 200g','Dairy',135,81,30,DATE_ADD(CURDATE(),INTERVAL 60 DAY),2),
('Ghee 500ml','Dairy',360,216,40,DATE_ADD(CURDATE(),INTERVAL 365 DAY),2),
('Lassi 300ml','Dairy',32,19,80,DATE_ADD(CURDATE(),INTERVAL 2 DAY),2),
('Buttermilk 500ml','Dairy',25,15,100,DATE_ADD(CURDATE(),INTERVAL 2 DAY),2),
('Full Cream Milk 500ml','Dairy',35,21,90,DATE_ADD(CURDATE(),INTERVAL 2 DAY),2),
('Cream 200ml','Dairy',78,47,35,DATE_ADD(CURDATE(),INTERVAL 14 DAY),2),
-- Personal Care (10)
('Colgate Toothpaste 200g','Personal Care',98,59,60,DATE_ADD(CURDATE(),INTERVAL 730 DAY),2),
('Lux Soap 75g','Personal Care',38,23,100,DATE_ADD(CURDATE(),INTERVAL 730 DAY),2),
('Pantene Shampoo 200ml','Personal Care',188,113,40,DATE_ADD(CURDATE(),INTERVAL 730 DAY),2),
('Dettol Handwash 250ml','Personal Care',102,61,70,DATE_ADD(CURDATE(),INTERVAL 730 DAY),2),
('Stayfree Pads Pack','Personal Care',78,47,50,DATE_ADD(CURDATE(),INTERVAL 730 DAY),2),
('Ponds Cream 50ml','Personal Care',125,75,45,DATE_ADD(CURDATE(),INTERVAL 730 DAY),2),
('Fogg Deodorant 150ml','Personal Care',195,117,35,DATE_ADD(CURDATE(),INTERVAL 730 DAY),2),
('Rejoice Shampoo 200ml','Personal Care',178,107,40,DATE_ADD(CURDATE(),INTERVAL 730 DAY),2),
('Fair & Lovely 50g','Personal Care',95,57,60,DATE_ADD(CURDATE(),INTERVAL 730 DAY),2),
('Oral B Brush 2pk','Personal Care',145,87,30,DATE_ADD(CURDATE(),INTERVAL 730 DAY),2),
-- Beverages (10)
('Coca-Cola 750ml','Beverages',47,28,150,DATE_ADD(CURDATE(),INTERVAL 180 DAY),2),
('Pepsi 750ml','Beverages',44,26,140,DATE_ADD(CURDATE(),INTERVAL 180 DAY),2),
('7Up 750ml','Beverages',43,26,130,DATE_ADD(CURDATE(),INTERVAL 180 DAY),2),
('Appy Fizz 250ml','Beverages',25,15,180,DATE_ADD(CURDATE(),INTERVAL 180 DAY),2),
('Real Juice 200ml','Beverages',28,17,160,DATE_ADD(CURDATE(),INTERVAL 90 DAY),2),
('Monster Energy 350ml','Beverages',130,78,60,DATE_ADD(CURDATE(),INTERVAL 365 DAY),2),
('Kinley Water 1L','Beverages',22,13,250,DATE_ADD(CURDATE(),INTERVAL 365 DAY),2),
('Bru Coffee 50g','Beverages',190,114,50,DATE_ADD(CURDATE(),INTERVAL 365 DAY),2),
('Taj Mahal Tea 250g','Grocery',160,96,70,DATE_ADD(CURDATE(),INTERVAL 365 DAY),2),
('Boost 500g','Beverages',385,231,30,DATE_ADD(CURDATE(),INTERVAL 365 DAY),2),
-- Snacks (10)
('Pringles 165g','Snacks',178,107,50,DATE_ADD(CURDATE(),INTERVAL 90 DAY),2),
('Uncle Chipps 50g','Snacks',20,12,200,DATE_ADD(CURDATE(),INTERVAL 90 DAY),2),
('Hide & Seek 150g','Snacks',55,33,90,DATE_ADD(CURDATE(),INTERVAL 180 DAY),2),
('Bourbon Biscuit 150g','Snacks',30,18,180,DATE_ADD(CURDATE(),INTERVAL 180 DAY),2),
('50-50 Biscuit 100g','Snacks',18,11,220,DATE_ADD(CURDATE(),INTERVAL 180 DAY),2),
('Bikaji Bhujia 200g','Snacks',75,45,100,DATE_ADD(CURDATE(),INTERVAL 180 DAY),2),
('Pistachios 250g','Snacks',350,210,25,DATE_ADD(CURDATE(),INTERVAL 365 DAY),2),
('Trail Mix 200g','Snacks',195,117,30,DATE_ADD(CURDATE(),INTERVAL 180 DAY),2),
('Doritos 200g','Snacks',195,117,55,DATE_ADD(CURDATE(),INTERVAL 90 DAY),2),
('Monaco Biscuits 150g','Snacks',28,17,160,DATE_ADD(CURDATE(),INTERVAL 180 DAY),2),
-- Household (10)
('Tide Plus 1kg','Household',210,126,70,DATE_ADD(CURDATE(),INTERVAL 730 DAY),2),
('Rin Detergent 1kg','Household',125,75,80,DATE_ADD(CURDATE(),INTERVAL 730 DAY),2),
('Pril Dish Wash 500ml','Household',85,51,90,DATE_ADD(CURDATE(),INTERVAL 730 DAY),2),
('Lizol Floor Cleaner 1L','Household',195,117,45,DATE_ADD(CURDATE(),INTERVAL 730 DAY),2),
('Odonil Air Freshener','Household',75,45,60,DATE_ADD(CURDATE(),INTERVAL 365 DAY),2),
('Good Night Liquid','Household',125,75,70,DATE_ADD(CURDATE(),INTERVAL 365 DAY),2),
('Baygon Spray 500ml','Household',220,132,40,DATE_ADD(CURDATE(),INTERVAL 365 DAY),2),
('Scotch Brite Scrub','Household',35,21,100,DATE_ADD(CURDATE(),INTERVAL 730 DAY),2),
('Cello Tape Roll','Household',45,27,80,DATE_ADD(CURDATE(),INTERVAL 730 DAY),2),
('Tissue Paper Box','Household',120,72,55,DATE_ADD(CURDATE(),INTERVAL 730 DAY),2),
-- Frozen (5)
('Frozen Peas 500g','Frozen',68,41,60,DATE_ADD(CURDATE(),INTERVAL 90 DAY),2),
('Frozen French Fries','Frozen',185,111,35,DATE_ADD(CURDATE(),INTERVAL 60 DAY),2),
('Ice Cream 500ml','Frozen',185,111,25,DATE_ADD(CURDATE(),INTERVAL 60 DAY),2),
('Frozen Mix Vegetables','Frozen',95,57,40,DATE_ADD(CURDATE(),INTERVAL 90 DAY),2),
('Frozen Fish 250g','Frozen',280,168,20,DATE_ADD(CURDATE(),INTERVAL 60 DAY),2),
-- Packaged Food (5)
('Maggi Noodles 70g','Packaged Food',15,9,400,DATE_ADD(CURDATE(),INTERVAL 365 DAY),2),
('Sunfeast Noodles 70g','Packaged Food',13,8,350,DATE_ADD(CURDATE(),INTERVAL 365 DAY),2),
('Knorr Soup 50g','Packaged Food',38,23,120,DATE_ADD(CURDATE(),INTERVAL 365 DAY),2),
('Kissan Ketchup 500g','Packaged Food',175,105,55,DATE_ADD(CURDATE(),INTERVAL 365 DAY),2),
('Nutrela Soya 200g','Packaged Food',48,29,90,DATE_ADD(CURDATE(),INTERVAL 365 DAY),2);

-- WORKERS STORE 2 (25)
INSERT INTO workers (name, phone, role, store_id, salary, hire_date) VALUES
('Kumaresan V','9222222201','Store Manager',2,38000,'2019-06-10'),
('Subramani R','9222222202','Cashier',2,19000,'2020-08-15'),
('Nithya K','9222222203','Stock Manager',2,23000,'2020-01-20'),
('Arun Balaji','9222222204','Sales Executive',2,17000,'2021-03-10'),
('Rajendran M','9222222205','Security Guard',2,14500,'2019-11-01'),
('Priya Dharshini','9222222206','Cashier',2,19000,'2021-07-22'),
('Prabhu S','9222222207','Delivery Boy',2,15500,'2022-02-10'),
('Mythili R','9222222208','Customer Service',2,17500,'2021-09-30'),
('Vengatesan P','9222222209','Stock Manager',2,22000,'2020-05-15'),
('Jayanthimala S','9222222210','Sales Executive',2,17000,'2022-04-20'),
('Sudalaimuthu K','9222222211','Janitor',2,12500,'2019-07-15'),
('Hemamalini V','9222222212','Billing Executive',2,18000,'2021-10-10'),
('Muthukaruppan D','9222222213','Security Guard',2,14500,'2021-01-01'),
('Sivapriya K','9222222214','Customer Service',2,16500,'2022-07-15'),
('Shanmugapriya T','9222222215','Delivery Boy',2,15500,'2022-12-25'),
('Ambika S','9222222216','Sales Executive',2,17000,'2023-02-10'),
('Janakiraman R','9222222217','Stock Manager',2,22000,'2020-09-20'),
('Durga Devi','9222222218','Cashier',2,19000,'2021-05-05'),
('Arulmurugan V','9222222219','Store Supervisor',2,28000,'2019-04-12'),
('Banupriya M','9222222220','Sales Executive',2,17000,'2022-10-15'),
('Chelladurai S','9222222221','Delivery Boy',2,15000,'2023-04-01'),
('Gomathy A','9222222222','Cashier',2,19000,'2020-11-20'),
('Prakasam T','9222222223','Security Guard',2,14500,'2021-08-15'),
('Indhumathi R','9222222224','Customer Service',2,17000,'2022-12-10'),
('Kalidasan M','9222222225','Janitor',2,12500,'2020-06-22');

-- ATTENDANCE for Store 2 workers
INSERT INTO attendance (worker_id, date, status)
SELECT w.id, DATE_SUB(CURDATE(), INTERVAL n DAY),
  CASE WHEN RAND() < 0.80 THEN 'present' WHEN RAND() < 0.6 THEN 'absent' ELSE 'leave' END
FROM workers w
CROSS JOIN (
  SELECT 0 AS n UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5
  UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10
  UNION SELECT 11 UNION SELECT 12 UNION SELECT 13 UNION SELECT 14 UNION SELECT 15
  UNION SELECT 16 UNION SELECT 17 UNION SELECT 18 UNION SELECT 19 UNION SELECT 20
  UNION SELECT 21 UNION SELECT 22 UNION SELECT 23 UNION SELECT 24 UNION SELECT 25
  UNION SELECT 26 UNION SELECT 27 UNION SELECT 28 UNION SELECT 29
) AS days
WHERE w.store_id = 2;

-- SALARIES STORE 2
INSERT INTO salaries (worker_id, store_id, basic_salary, bonus, total_salary, month, paid_date)
SELECT id, 2, salary, ROUND(salary*0.12,0), ROUND(salary*1.12,0), 'March-2025', '2025-03-31'
FROM workers WHERE store_id=2;

INSERT INTO salaries (worker_id, store_id, basic_salary, bonus, total_salary, month, paid_date)
SELECT id, 2, salary, ROUND(salary*0.09,0), ROUND(salary*1.09,0), 'April-2025', '2025-04-30'
FROM workers WHERE store_id=2;

-- ORDERS STORE 2 (350 orders)
INSERT INTO orders (customer_id, total_amount, order_type, order_date)
SELECT 
  FLOOR(RAND()*105)+1,
  ROUND(RAND()*2500+150, 2),
  CASE WHEN RAND()<0.55 THEN 'store' ELSE 'online' END,
  DATE_SUB(NOW(), INTERVAL FLOOR(RAND()*60) DAY)
FROM (
  SELECT a.N + b.N*10 + c.N*100 + 1 n FROM 
  (SELECT 0 AS N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) a,
  (SELECT 0 AS N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) b,
  (SELECT 0 AS N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3) c
) AS nums WHERE n <= 350;

-- ORDER ITEMS STORE 2
INSERT INTO order_items (order_id, product_id, quantity, unit_price)
SELECT o.id, FLOOR(RAND()*90)+1, FLOOR(RAND()*5)+1, p.price
FROM orders o JOIN products p ON p.id = FLOOR(RAND()*90)+1
LIMIT 1000;

-- ADVERTISEMENTS STORE 2
INSERT INTO advertisements (store_id, type, amount, month, date, platform, impressions, conversions) VALUES
(2,'Social Media',30000,'January-2025','2025-01-08','Instagram',55000,1500),
(2,'Google Ads',42000,'January-2025','2025-01-12','Google',88000,2500),
(2,'Radio',10000,'January-2025','2025-01-18','Radio',20000,600),
(2,'Social Media',32000,'February-2025','2025-02-08','Facebook',60000,1700),
(2,'Google Ads',45000,'February-2025','2025-02-14','Google',92000,2700),
(2,'Newspaper',15000,'February-2025','2025-02-22','Print',8000,400),
(2,'Social Media',35000,'March-2025','2025-03-08','Instagram',68000,2000),
(2,'Google Ads',48000,'March-2025','2025-03-12','Google',96000,2900),
(2,'YouTube Ads',25000,'March-2025','2025-03-22','YouTube',140000,3600),
(2,'Influencer','38000','April-2025','2025-04-08','Social',75000,2200);

-- LOANS STORE 2
INSERT INTO loans (store_id, total_loan, interest_rate, emi_amount, remaining_balance, start_date, end_date, lender) VALUES
(2,800000,11.5,16000,680000,'2022-06-01','2027-06-01','ICICI Bank'),
(2,150000,9.5,3500,90000,'2024-06-01','2026-06-01','Axis Bank');

-- LOAN PAYMENTS STORE 2
INSERT INTO loan_payments (loan_id, store_id, amount_paid, payment_date, month) VALUES
(1,2,16000,'2025-01-10','January-2025'),(1,2,16000,'2025-02-10','February-2025'),
(1,2,16000,'2025-03-10','March-2025'),(1,2,16000,'2025-04-10','April-2025'),
(2,2,3500,'2025-01-10','January-2025'),(2,2,3500,'2025-02-10','February-2025'),
(2,2,3500,'2025-03-10','March-2025'),(2,2,3500,'2025-04-10','April-2025');

-- ============================================================
-- SEED DATA FOR STORE 3 (db_store3)
-- ============================================================
USE db_store3;

-- CUSTOMERS (110)
INSERT INTO customers (name, phone, is_regular, email) VALUES
('Venkata Rao','9888003001',1,'venkata@email.com'),('Lakshmi Priya','9888003002',1,'lakshmipriya@email.com'),
('Srinivas K','9888003003',0,'srinivas@email.com'),('Bhagya Lakshmi','9888003004',1,'bhagya@email.com'),
('Narayana Reddy','9888003005',1,'narayana@email.com'),('Sarada Devi','9888003006',0,'sarada@email.com'),
('Tirumala Rao','9888003007',1,'tirumala@email.com'),('Vasundhara S','9888003008',1,'vasundhara@email.com'),
('Venkateswara P','9888003009',0,'venkatesh@email.com'),('Annapurna R','9888003010',1,'annapurna@email.com'),
('Raghu Nath','9888003011',1,'raghu@email.com'),('Tulasi K','9888003012',0,'tulasi@email.com'),
('Seshagiri V','9888003013',1,'seshagiri@email.com'),('Kameshwari P','9888003014',1,'kameshwari@email.com'),
('Hanumantha Rao','9888003015',0,'hanumantha@email.com'),('Santhakumari S','9888003016',1,'santha@email.com'),
('Prasad M','9888003017',1,'prasad@email.com'),('Vijayakumari R','9888003018',0,'vijayakumari@email.com'),
('Bhaskar K','9888003019',1,'bhaskar@email.com'),('Padmaja V','9888003020',1,'padmaja@email.com'),
('Gopal Rao','9888003021',0,'gopal@email.com'),('Naga Lakshmi','9888003022',1,'nagalakshmi@email.com'),
('Suryanarayana T','9888003023',1,'surya@email.com'),('Kanchana R','9888003024',0,'kanchana@email.com'),
('Ramakrishna P','9888003025',1,'ramakrishna@email.com'),('Saroja V','9888003026',0,'saroja.v@email.com'),
('Anjaneya K','9888003027',1,'anjaneya@email.com'),('Ratnamala S','9888003028',1,'ratnamala@email.com'),
('Srinivasa Rao','9888003029',0,'srinivasarao@email.com'),('Kalyani P','9888003030',1,'kalyani@email.com'),
('Narasimha R','9888003031',1,'narasimha@email.com'),('Yasoda K','9888003032',0,'yasoda@email.com'),
('Krishnamurthy V','9888003033',1,'krishnamurthy@email.com'),('Kalpana S','9888003034',1,'kalpana@email.com'),
('Raghunatha P','9888003035',0,'raghunath@email.com'),('Pushpavathi R','9888003036',1,'pushpavathi@email.com'),
('Venkataramaiah K','9888003037',1,'venkataramaiah@email.com'),('Indira V','9888003038',0,'indira.v@email.com'),
('Nageswara Rao','9888003039',1,'nagesh@email.com'),('Radha Devi','9888003040',1,'radha.d@email.com'),
('Suryakantham P','9888003041',0,'suryakantham@email.com'),('Rajeshwari K','9888003042',1,'rajeshwari@email.com'),
('Krishnaiah V','9888003043',1,'krishnaiah@email.com'),('Ratnabai S','9888003044',0,'ratnabai@email.com'),
('Subramanyam R','9888003045',1,'subramanyam@email.com'),('Sowmya K','9888003046',1,'sowmya@email.com'),
('Prabhakar P','9888003047',0,'prabhakar@email.com'),('Meenakshi V','9888003048',1,'meenakshi.v@email.com'),
('Anjaiah S','9888003049',1,'anjaiah@email.com'),('Himavathi R','9888003050',0,'himavathi@email.com'),
('Appa Rao K','9888003051',1,'appaRao@email.com'),('Sunitha V','9888003052',1,'sunitha.v@email.com'),
('NitinKumar P','9888003053',0,'nitin@email.com'),('Sridevi R','9888003054',1,'sridevi@email.com'),
('Venugopal K','9888003055',1,'venugopal.k@email.com'),('Phanikumari S','9888003056',0,'phanikumari@email.com'),
('Kondala Rao V','9888003057',1,'kondala@email.com'),('Ramapriya P','9888003058',1,'ramapriya@email.com'),
('Narsimha K','9888003059',0,'narsimha@email.com'),('Tarangini R','9888003060',1,'tarangini@email.com'),
('Achyutam P','9888003061',1,'achyutam@email.com'),('Krishnaveni S','9888003062',0,'krishnaveni@email.com'),
('Veerabhadra K','9888003063',1,'veerbhadra@email.com'),('Kusuma R','9888003064',1,'kusuma@email.com'),
('Panduranga V','9888003065',0,'panduranga@email.com'),('Mythili P','9888003066',1,'mythili.p@email.com'),
('Someswara K','9888003067',1,'someswara@email.com'),('Hemavathi R','9888003068',0,'hemavathi@email.com'),
('Satyanarayana P','9888003069',1,'satyanarayana@email.com'),('Swarajya Lakshmi','9888003070',1,'swarajya@email.com'),
('Veeraiah K','9888003071',0,'veeraiah@email.com'),('Bhramaramba S','9888003072',1,'bhramaramba@email.com'),
('Srinivasulu R','9888003073',1,'srinivasulu@email.com'),('Kalidasi P','9888003074',0,'kalidasi@email.com'),
('Koteswara K','9888003075',1,'koteswara@email.com'),('Sumangali V','9888003076',1,'sumangali@email.com'),
('Madhava Rao','9888003077',0,'madhava@email.com'),('Padmalatha S','9888003078',1,'padmalatha@email.com'),
('Suresh Babu K','9888003079',1,'suresh.k@email.com'),('Valmiki R','9888003080',0,'valmiki@email.com'),
('Aravinda P','9888003081',1,'aravinda@email.com'),('Durgamba S','9888003082',1,'durgamba@email.com'),
('Chandraiah K','9888003083',0,'chandraiah@email.com'),('Kalavathi R','9888003084',1,'kalavathi@email.com'),
('Anjaiah P','9888003085',1,'anjaiah.p@email.com'),('Revathi S','9888003086',0,'revathi@email.com'),
('Veeraraghava K','9888003087',1,'veeraraghava@email.com'),('Naga Bhushana','9888003088',1,'naga@email.com'),
('Purna Chandra R','9888003089',0,'purna@email.com'),('Savithri P','9888003090',1,'savithri@email.com'),
('Trivikrama K','9888003091',1,'trivikrama@email.com'),('Nagamani S','9888003092',0,'nagamani@email.com'),
('Ramana Rao V','9888003093',1,'ramanarao@email.com'),('Jankamma P','9888003094',1,'jankamma@email.com'),
('Venkateswara K','9888003095',0,'venkateswara.k@email.com'),('Pratyusha R','9888003096',1,'pratyusha@email.com'),
('Sreeramulu P','9888003097',1,'sreeramulu@email.com'),('Satyavathi S','9888003098',0,'satyavathi@email.com'),
('Nageswara K','9888003099',1,'nagesh.k@email.com'),('Parvathamma R','9888003100',1,'parvathamma@email.com'),
('Hari Babu P','9888003101',0,'hari@email.com'),('Nagalakshmi S','9888003102',1,'nagalakshmi.s@email.com'),
('Venkateswarlu K','9888003103',1,'venkateswarlu@email.com'),('Rama Devi R','9888003104',0,'ramadevi@email.com'),
('Subrahmanyam P','9888003105',1,'subrahmanyam@email.com'),('Suseela S','9888003106',1,'suseela@email.com'),
('Nageswara Prasad','9888003107',0,'nageswara@email.com'),('Lakshmi Kumari R','9888003108',1,'lakshmikumari@email.com'),
('Butchi Babu K','9888003109',1,'butchi@email.com'),('Mangamma V','9888003110',0,'mangamma@email.com');

-- PRODUCTS STORE 3 (90 products - different pricing)
INSERT INTO products (name, category, price, cost_price, stock, expiry_date, store_id) VALUES
-- Vegetables (10)
('Tomato','Vegetables',28,17,30,DATE_ADD(CURDATE(),INTERVAL 3 DAY),3),
('Potato','Vegetables',22,13,250,DATE_ADD(CURDATE(),INTERVAL 14 DAY),3),
('Onion','Vegetables',33,20,160,DATE_ADD(CURDATE(),INTERVAL 9 DAY),3),
('Cabbage','Vegetables',26,15,100,DATE_ADD(CURDATE(),INTERVAL 5 DAY),3),
('Carrot','Vegetables',38,23,140,DATE_ADD(CURDATE(),INTERVAL 8 DAY),3),
('Spinach','Vegetables',18,11,70,DATE_ADD(CURDATE(),INTERVAL 3 DAY),3),
('Brinjal','Vegetables',20,12,110,DATE_ADD(CURDATE(),INTERVAL 7 DAY),3),
('Cauliflower','Vegetables',42,25,0,DATE_ADD(CURDATE(),INTERVAL 4 DAY),3),
('Beans','Vegetables',48,29,3,DATE_ADD(CURDATE(),INTERVAL 5 DAY),3),
('Lady Finger','Vegetables',35,21,85,DATE_ADD(CURDATE(),INTERVAL 4 DAY),3),
-- Fruits (10)
('Banana','Fruits',38,23,400,DATE_ADD(CURDATE(),INTERVAL 6 DAY),3),
('Apple','Fruits',145,87,140,DATE_ADD(CURDATE(),INTERVAL 16 DAY),3),
('Mango','Fruits',75,45,250,DATE_ADD(CURDATE(),INTERVAL 9 DAY),3),
('Orange','Fruits',58,35,130,DATE_ADD(CURDATE(),INTERVAL 11 DAY),3),
('Grapes','Fruits',88,53,95,DATE_ADD(CURDATE(),INTERVAL 6 DAY),3),
('Watermelon','Fruits',28,17,55,DATE_ADD(CURDATE(),INTERVAL 9 DAY),3),
('Papaya','Fruits',33,20,75,DATE_ADD(CURDATE(),INTERVAL 4 DAY),3),
('Guava','Fruits',43,26,100,DATE_ADD(CURDATE(),INTERVAL 7 DAY),3),
('Pomegranate','Fruits',115,69,60,DATE_ADD(CURDATE(),INTERVAL 13 DAY),3),
('Coconut','Fruits',30,18,200,DATE_ADD(CURDATE(),INTERVAL 30 DAY),3),
-- Grocery (10)
('Sona Masoori Rice 5kg','Grocery',425,255,90,DATE_ADD(CURDATE(),INTERVAL 365 DAY),3),
('Wheat Flour 5kg','Grocery',200,120,75,DATE_ADD(CURDATE(),INTERVAL 180 DAY),3),
('Red Gram Dal 1kg','Grocery',140,84,80,DATE_ADD(CURDATE(),INTERVAL 180 DAY),3),
('Green Gram 500g','Grocery',75,45,95,DATE_ADD(CURDATE(),INTERVAL 180 DAY),3),
('Groundnut Oil 1L','Grocery',195,117,65,DATE_ADD(CURDATE(),INTERVAL 365 DAY),3),
('Turmeric Powder 100g','Grocery',35,21,140,DATE_ADD(CURDATE(),INTERVAL 365 DAY),3),
('Tamarind 250g','Grocery',45,27,110,DATE_ADD(CURDATE(),INTERVAL 365 DAY),3),
('Hing 50g','Grocery',65,39,90,DATE_ADD(CURDATE(),INTERVAL 730 DAY),3),
('Salt 1kg','Grocery',20,12,220,DATE_ADD(CURDATE(),INTERVAL 730 DAY),3),
('Palm Sugar 500g','Grocery',65,39,80,DATE_ADD(CURDATE(),INTERVAL 365 DAY),3),
-- Dairy (10)
('Milk 1L','Dairy',52,31,220,DATE_ADD(CURDATE(),INTERVAL 2 DAY),3),
('Curd 500g','Dairy',33,20,180,DATE_ADD(CURDATE(),INTERVAL 3 DAY),3),
('Butter 100g','Dairy',52,31,90,DATE_ADD(CURDATE(),INTERVAL 30 DAY),3),
('Paneer 200g','Dairy',88,53,70,DATE_ADD(CURDATE(),INTERVAL 4 DAY),3),
('Khoa 250g','Dairy',120,72,40,DATE_ADD(CURDATE(),INTERVAL 3 DAY),3),
('Ghee 500ml','Dairy',340,204,55,DATE_ADD(CURDATE(),INTERVAL 365 DAY),3),
('Lassi 300ml','Dairy',28,17,120,DATE_ADD(CURDATE(),INTERVAL 2 DAY),3),
('Chach 500ml','Dairy',22,13,110,DATE_ADD(CURDATE(),INTERVAL 2 DAY),3),
('Amul Milk 500ml','Dairy',30,18,140,DATE_ADD(CURDATE(),INTERVAL 2 DAY),3),
('Pala Payasam 200ml','Dairy',65,39,50,DATE_ADD(CURDATE(),INTERVAL 3 DAY),3),
-- Personal Care (10)
('Pepsodent Toothpaste 200g','Personal Care',88,53,90,DATE_ADD(CURDATE(),INTERVAL 730 DAY),3),
('Hamam Soap 100g','Personal Care',42,25,130,DATE_ADD(CURDATE(),INTERVAL 730 DAY),3),
('Clinic Plus Shampoo 200ml','Personal Care',170,102,60,DATE_ADD(CURDATE(),INTERVAL 730 DAY),3),
('Savlon Handwash 250ml','Personal Care',95,57,80,DATE_ADD(CURDATE(),INTERVAL 730 DAY),3),
('Carefree Pads','Personal Care',72,43,65,DATE_ADD(CURDATE(),INTERVAL 730 DAY),3),
('Lakme Lotion 100ml','Personal Care',135,81,50,DATE_ADD(CURDATE(),INTERVAL 730 DAY),3),
('7 O Clock Razor','Personal Care',75,45,80,DATE_ADD(CURDATE(),INTERVAL 730 DAY),3),
('Sunsilk Shampoo 200ml','Personal Care',185,111,45,DATE_ADD(CURDATE(),INTERVAL 730 DAY),3),
('Boroplus Cream 40g','Personal Care',95,57,70,DATE_ADD(CURDATE(),INTERVAL 730 DAY),3),
('Colgate Mouth Rinse','Personal Care',160,96,40,DATE_ADD(CURDATE(),INTERVAL 730 DAY),3),
-- Beverages (10)
('Thumbs Up 750ml','Beverages',46,28,170,DATE_ADD(CURDATE(),INTERVAL 180 DAY),3),
('Pepsi 750ml','Beverages',43,26,160,DATE_ADD(CURDATE(),INTERVAL 180 DAY),3),
('Limca 750ml','Beverages',44,26,140,DATE_ADD(CURDATE(),INTERVAL 180 DAY),3),
('Slice 250ml','Beverages',22,13,210,DATE_ADD(CURDATE(),INTERVAL 180 DAY),3),
('Tropicana 200ml','Beverages',35,21,180,DATE_ADD(CURDATE(),INTERVAL 90 DAY),3),
('5 Hour Energy 60ml','Beverages',95,57,70,DATE_ADD(CURDATE(),INTERVAL 365 DAY),3),
('Aquafina 1L','Beverages',22,13,280,DATE_ADD(CURDATE(),INTERVAL 365 DAY),3),
('Horlicks 500g','Beverages',390,234,40,DATE_ADD(CURDATE(),INTERVAL 365 DAY),3),
('Nescafe Gold 50g','Beverages',280,168,35,DATE_ADD(CURDATE(),INTERVAL 365 DAY),3),
('MTR Filter Coffee 200g','Beverages',165,99,55,DATE_ADD(CURDATE(),INTERVAL 365 DAY),3),
-- Snacks (10)
('Lay's Classic 75g','Snacks',22,13,260,DATE_ADD(CURDATE(),INTERVAL 90 DAY),3),
('Balaji Wafers 60g','Snacks',18,11,240,DATE_ADD(CURDATE(),INTERVAL 90 DAY),3),
('Britannia Tiger 100g','Snacks',15,9,300,DATE_ADD(CURDATE(),INTERVAL 180 DAY),3),
('Sunfeast Dark Fantasy','Snacks',50,30,160,DATE_ADD(CURDATE(),INTERVAL 180 DAY),3),
('Krackjack 150g','Snacks',22,13,220,DATE_ADD(CURDATE(),INTERVAL 180 DAY),3),
('Navratan Mix 200g','Snacks',70,42,130,DATE_ADD(CURDATE(),INTERVAL 180 DAY),3),
('Walnuts 250g','Snacks',450,270,20,DATE_ADD(CURDATE(),INTERVAL 365 DAY),3),
('Raisins 200g','Snacks',120,72,55,DATE_ADD(CURDATE(),INTERVAL 180 DAY),3),
('Cheetos 100g','Snacks',45,27,80,DATE_ADD(CURDATE(),INTERVAL 90 DAY),3),
('Nice Biscuits 300g','Snacks',38,23,170,DATE_ADD(CURDATE(),INTERVAL 180 DAY),3),
-- Household (10)
('Wheel Detergent 1kg','Household',85,51,90,DATE_ADD(CURDATE(),INTERVAL 730 DAY),3),
('Sunlight Bar 150g','Household',25,15,150,DATE_ADD(CURDATE(),INTERVAL 730 DAY),3),
('Exo Dish Wash 750ml','Household',89,53,80,DATE_ADD(CURDATE(),INTERVAL 730 DAY),3),
('Domex Toilet Cleaner','Household',105,63,60,DATE_ADD(CURDATE(),INTERVAL 730 DAY),3),
('Febreze Air Freshener','Household',220,132,30,DATE_ADD(CURDATE(),INTERVAL 365 DAY),3),
('All Out Mosquito Liquid','Household',120,72,70,DATE_ADD(CURDATE(),INTERVAL 365 DAY),3),
('Raid Insecticide Spray','Household',195,117,40,DATE_ADD(CURDATE(),INTERVAL 365 DAY),3),
('Mr. Muscle Kitchen Cleaner','Household',180,108,35,DATE_ADD(CURDATE(),INTERVAL 365 DAY),3),
('Phenyl 1L','Household',75,45,75,DATE_ADD(CURDATE(),INTERVAL 730 DAY),3),
('Broom & Dustpan Set','Household',250,150,30,DATE_ADD(CURDATE(),INTERVAL 730 DAY),3),
-- Frozen (5)
('Frozen Peas 500g','Frozen',62,37,90,DATE_ADD(CURDATE(),INTERVAL 90 DAY),3),
('Veggie Nuggets 300g','Frozen',195,117,40,DATE_ADD(CURDATE(),INTERVAL 60 DAY),3),
('Ice Cream 1L','Frozen',290,174,25,DATE_ADD(CURDATE(),INTERVAL 60 DAY),3),
('Frozen Paneer 200g','Frozen',110,66,55,DATE_ADD(CURDATE(),INTERVAL 90 DAY),3),
('Frozen Chicken 500g','Frozen',380,228,20,DATE_ADD(CURDATE(),INTERVAL 60 DAY),3),
-- Packaged Food (5)
('Maggi Masala 70g','Packaged Food',15,9,450,DATE_ADD(CURDATE(),INTERVAL 365 DAY),3),
('MTR Ready Meals 300g','Packaged Food',145,87,70,DATE_ADD(CURDATE(),INTERVAL 365 DAY),3),
('Priya Pickles 400g','Packaged Food',110,66,80,DATE_ADD(CURDATE(),INTERVAL 365 DAY),3),
('Patanjali Honey 500g','Packaged Food',250,150,50,DATE_ADD(CURDATE(),INTERVAL 365 DAY),3),
('Haldirams Dal Makhani 300g','Packaged Food',175,105,60,DATE_ADD(CURDATE(),INTERVAL 365 DAY),3);

-- WORKERS STORE 3 (25)
INSERT INTO workers (name, phone, role, store_id, salary, hire_date) VALUES
('Venkateswara P','9333333301','Store Manager',3,40000,'2018-09-15'),
('Lalitha S','9333333302','Cashier',3,20000,'2019-11-10'),
('Srinivasa K','9333333303','Stock Manager',3,24000,'2019-05-20'),
('Navya R','9333333304','Sales Executive',3,18000,'2021-01-14'),
('Suresh Rao M','9333333305','Security Guard',3,15000,'2019-08-01'),
('Sowjanya V','9333333306','Cashier',3,20000,'2021-06-22'),
('Kiran Kumar P','9333333307','Delivery Boy',3,16000,'2022-03-10'),
('Roja S','9333333308','Customer Service',3,18000,'2021-07-30'),
('Ravi Chandra K','9333333309','Stock Manager',3,23000,'2020-02-15'),
('Swapna Rani R','9333333310','Sales Executive',3,18000,'2022-05-20'),
('Jagadish P','9333333311','Janitor',3,13000,'2018-05-15'),
('Bhavana S','9333333312','Billing Executive',3,19000,'2021-08-10'),
('Satish Kumar D','9333333313','Security Guard',3,15000,'2020-10-01'),
('Hymavathi L','9333333314','Customer Service',3,17000,'2022-04-15'),
('Prakash Rao T','9333333315','Delivery Boy',3,16000,'2022-10-25'),
('Mounika D','9333333316','Sales Executive',3,18000,'2023-02-10'),
('Prudhvi Raj S','9333333317','Stock Manager',3,23000,'2020-07-20'),
('Sireesha K','9333333318','Cashier',3,20000,'2021-03-05'),
('Mahesh Kumar V','9333333319','Store Supervisor',3,30000,'2018-01-12'),
('Pooja Rani S','9333333320','Sales Executive',3,18000,'2022-08-15'),
('Teja P','9333333321','Delivery Boy',3,16000,'2023-05-01'),
('Radhika K','9333333322','Cashier',3,20000,'2020-09-20'),
('Ganesh R','9333333323','Security Guard',3,15000,'2021-06-15'),
('Divya M','9333333324','Customer Service',3,17000,'2022-10-10'),
('Vijay Kumar S','9333333325','Janitor',3,13000,'2020-04-22');

-- ATTENDANCE for Store 3 workers
INSERT INTO attendance (worker_id, date, status)
SELECT w.id, DATE_SUB(CURDATE(), INTERVAL n DAY),
  CASE WHEN RAND() < 0.88 THEN 'present' WHEN RAND() < 0.4 THEN 'absent' ELSE 'leave' END
FROM workers w
CROSS JOIN (
  SELECT 0 AS n UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5
  UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10
  UNION SELECT 11 UNION SELECT 12 UNION SELECT 13 UNION SELECT 14 UNION SELECT 15
  UNION SELECT 16 UNION SELECT 17 UNION SELECT 18 UNION SELECT 19 UNION SELECT 20
  UNION SELECT 21 UNION SELECT 22 UNION SELECT 23 UNION SELECT 24 UNION SELECT 25
  UNION SELECT 26 UNION SELECT 27 UNION SELECT 28 UNION SELECT 29
) AS days
WHERE w.store_id = 3;

-- SALARIES STORE 3
INSERT INTO salaries (worker_id, store_id, basic_salary, bonus, total_salary, month, paid_date)
SELECT id, 3, salary, ROUND(salary*0.15,0), ROUND(salary*1.15,0), 'March-2025', '2025-03-31'
FROM workers WHERE store_id=3;

INSERT INTO salaries (worker_id, store_id, basic_salary, bonus, total_salary, month, paid_date)
SELECT id, 3, salary, ROUND(salary*0.12,0), ROUND(salary*1.12,0), 'April-2025', '2025-04-30'
FROM workers WHERE store_id=3;

-- ORDERS STORE 3 (400 orders)
INSERT INTO orders (customer_id, total_amount, order_type, order_date)
SELECT 
  FLOOR(RAND()*110)+1,
  ROUND(RAND()*3000+200, 2),
  CASE WHEN RAND()<0.65 THEN 'store' ELSE 'online' END,
  DATE_SUB(NOW(), INTERVAL FLOOR(RAND()*60) DAY)
FROM (
  SELECT a.N + b.N*10 + c.N*100 + 1 n FROM 
  (SELECT 0 AS N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) a,
  (SELECT 0 AS N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) b,
  (SELECT 0 AS N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3) c
) AS nums WHERE n <= 400;

-- ORDER ITEMS STORE 3
INSERT INTO order_items (order_id, product_id, quantity, unit_price)
SELECT o.id, FLOOR(RAND()*90)+1, FLOOR(RAND()*6)+1, p.price
FROM orders o JOIN products p ON p.id = FLOOR(RAND()*90)+1
LIMIT 1100;

-- ADVERTISEMENTS STORE 3
INSERT INTO advertisements (store_id, type, amount, month, date, platform, impressions, conversions) VALUES
(3,'Social Media',22000,'January-2025','2025-01-06','Facebook',40000,1100),
(3,'Google Ads',32000,'January-2025','2025-01-11','Google',65000,1900),
(3,'Pamphlets',5000,'January-2025','2025-01-16','Print',3000,200),
(3,'Social Media',25000,'February-2025','2025-02-06','Instagram',48000,1400),
(3,'Google Ads',38000,'February-2025','2025-02-13','Google',78000,2200),
(3,'SMS Campaign',10000,'February-2025','2025-02-21','SMS',12000,700),
(3,'Social Media',28000,'March-2025','2025-03-06','Facebook',56000,1700),
(3,'Google Ads',40000,'March-2025','2025-03-11','Google',82000,2500),
(3,'YouTube Ads',20000,'March-2025','2025-03-21','YouTube',110000,3000),
(3,'Social Media',30000,'April-2025','2025-04-06','Instagram',60000,1900);

-- LOANS STORE 3
INSERT INTO loans (store_id, total_loan, interest_rate, emi_amount, remaining_balance, start_date, end_date, lender) VALUES
(3,600000,12.0,13500,520000,'2022-09-01','2026-09-01','Kotak Bank'),
(3,100000,8.5,2200,65000,'2024-09-01','2026-09-01','IDFC Bank');

-- LOAN PAYMENTS STORE 3
INSERT INTO loan_payments (loan_id, store_id, amount_paid, payment_date, month) VALUES
(1,3,13500,'2025-01-15','January-2025'),(1,3,13500,'2025-02-15','February-2025'),
(1,3,13500,'2025-03-15','March-2025'),(1,3,13500,'2025-04-15','April-2025'),
(2,3,2200,'2025-01-15','January-2025'),(2,3,2200,'2025-02-15','February-2025'),
(2,3,2200,'2025-03-15','March-2025'),(2,3,2200,'2025-04-15','April-2025');

-- ============================================================
-- MASTER DB INITIAL DATA
-- ============================================================
USE db_master;
INSERT INTO ai_decisions (store_id, category, message, decision_type, alert_type) VALUES
(0,'Inventory','Running initial system check - all databases connected','system','info'),
(1,'Expiry','Milk expiring in 2 days at Store 1 → Apply 20% discount to clear stock','expiry','warning'),
(2,'Stock','Paneer stock critically low (2 units) at Store 2 → Place reorder immediately','stock','danger'),
(3,'Stock','Cauliflower out of stock at Store 3 → Request cross-store transfer from Store 1','stock','danger'),
(1,'Workforce','Store 1 attendance above 85% this week → Excellent performance','workforce','success'),
(2,'Finance','Store 2 EMI due in 3 days (₹16,000 + ₹3,500) → Ensure funds available','finance','warning'),
(0,'Revenue','Combined revenue target of ₹50L for April is 78% achieved → On track','revenue','success');

INSERT INTO system_alerts (store_id, alert_type, title, message) VALUES
(2,'danger','Critical Low Stock','Paneer at Store 2 has only 2 units remaining'),
(3,'danger','Out of Stock','Cauliflower is completely out of stock at Store 3'),
(1,'warning','Expiry Alert','Milk at Store 1 expires in 2 days'),
(2,'warning','Expiry Alert','Cauliflower at Store 2 expires in 2 days'),
(0,'info','System Status','All 3 store databases connected successfully');
