create database shoppingcart;
use shoppingcart;


CREATE TABLE Users
(
    userid INT NOT NULL
    ,name VARCHAR(20)
    ,phoneNumber VARCHAR(20)
    ,PRIMARY KEY(userid)
);

CREATE TABLE Buyer
(
    userid INT NOT NULL
    ,PRIMARY KEY(userid)
    ,FOREIGN KEY(userid) REFERENCES Users(userid)
);

CREATE TABLE Seller
(
    userid INT NOT NULL
    ,PRIMARY KEY(userid)
    ,FOREIGN KEY(userid) REFERENCES Users(userid)
);

CREATE TABLE BankCard
(
    cardNumber VARCHAR(25) NOT NULL
    ,expiryDate DATE
    ,bank VARCHAR(20)
    ,PRIMARY KEY(cardNumber)
);

CREATE TABLE
CreditCard
(
    cardNumber VARCHAR(25) NOT NULL
    ,userid INT NOT NULL
    ,organization VARCHAR(20)
    ,PRIMARY KEY(cardNumber)
    ,FOREIGN KEY(cardNumber) REFERENCES BankCard(cardNumber)
    ,FOREIGN KEY(userid) REFERENCES Users(userid)
);

CREATE TABLE DebitCard
(
    cardNumber VARCHAR(25) NOT NULL
    ,userid INT NOT NULL
    ,PRIMARY KEY(cardNumber)
    ,FOREIGN KEY(cardNumber) REFERENCES BankCard(cardNumber)
    ,FOREIGN KEY(userid) REFERENCES Users(userid)
);

CREATE TABLE Address
(
    addrid INT NOT NULL
    ,userid INT NOT NULL
    ,name VARCHAR(50)
    ,contactPhoneNumber VARCHAR(20)
    ,province VARCHAR(100)
    ,city VARCHAR(100)
    ,streetaddr VARCHAR(100)
    ,postCode VARCHAR(12)
    ,PRIMARY KEY(addrid)
    ,FOREIGN KEY(userid) REFERENCES Users(userid)
);

CREATE TABLE Store
(
    sid INT NOT NULL
    ,name VARCHAR(20)
    ,province VARCHAR(20)
    ,city VARCHAR(20)
    ,streetaddr VARCHAR(20)
    ,customerGrade INT
    ,startTime DATE
    ,PRIMARY KEY(sid)
);

CREATE TABLE Brand
(
    brandName VARCHAR(20) NOT NULL
    ,PRIMARY KEY (brandName)
);

CREATE TABLE Product
(
    pid INT NOT NULL
    ,sid INT NOT NULL
    ,brand VARCHAR(50) NOT NULL
    ,name VARCHAR(100)
    ,type VARCHAR(50)
    ,modelNumber VARCHAR(50)
    ,color VARCHAR(50)
    ,amount INT
    ,price INT
    ,PRIMARY KEY(pid)
    ,FOREIGN KEY(sid) REFERENCES Store(sid)
    ,FOREIGN KEY(brand) REFERENCES Brand(brandName)
);

CREATE TABLE OrderItem
(
    itemid INT NOT NULL
    ,pid INT NOT NULL
    ,price INT
    ,creationTime DATE
    ,PRIMARY KEY(itemid)
    ,FOREIGN KEY(pid) REFERENCES Product(pid)
);

CREATE TABLE Orders
(
    orderNumber INT NOT NULL
    ,paymentState VARCHAR(12)
    ,creationTime DATE
    ,totalAmount INT
    ,PRIMARY KEY (orderNumber)
);


CREATE TABLE Comments  -- Weak Entity
(
    creationTime DATE NOT NULL
    ,userid INT NOT NULL
    ,pid INT NOT NULL
    ,grade FLOAT
    ,content VARCHAR(500)
    ,PRIMARY KEY(creationTime,userid,pid)
    ,FOREIGN KEY(userid) REFERENCES Buyer(userid)
    ,FOREIGN KEY(pid) REFERENCES Product(pid)
);

CREATE TABLE ServicePoint
(
    spid INT NOT NULL
    ,streetaddr VARCHAR(40)
    ,city VARCHAR(30)
    ,province VARCHAR(20)
    ,startTime VARCHAR(20)
    ,endTime VARCHAR(20)
    ,PRIMARY KEY(spid)
);
-- Relationship

CREATE TABLE Save_to_Shopping_Cart
(
    userid INT NOT NULL
    ,pid INT NOT NULL
    ,addTime DATE
    ,quantity INT
    ,PRIMARY KEY (userid,pid)
    ,FOREIGN KEY(userid) REFERENCES Buyer(userid)
    ,FOREIGN KEY(pid) REFERENCES Product(pid)
);

CREATE TABLE Contain
(
    orderNumber INT NOT NULL
    ,itemid INT NOT NULL
    ,quantity INT
    ,PRIMARY KEY (orderNumber,itemid)
    ,FOREIGN KEY(orderNumber) REFERENCES Orders(orderNumber)
    ,FOREIGN KEY(itemid) REFERENCES OrderItem(itemid)
);

CREATE TABLE Payment
(
    orderNumber INT NOT NULL
    ,creditcardNumber VARCHAR(25) NOT NULL
    ,payTime DATE
    ,PRIMARY KEY(orderNumber,creditcardNumber)
    ,FOREIGN KEY(orderNumber) REFERENCES Orders(orderNumber)
    ,FOREIGN KEY(creditcardNumber) REFERENCES CreditCard(cardNumber)
);

CREATE TABLE Deliver_To
(
    addrid INT NOT NULL
    ,orderNumber INT NOT NULL
    ,TimeDelivered DATE
    ,PRIMARY KEY(addrid,orderNumber)
    ,FOREIGN KEY(addrid) REFERENCES Address(addrid)
    ,FOREIGN KEY(orderNumber) REFERENCES Orders(orderNumber)
);

CREATE TABLE Manage
(
    userid INT NOT NULL
    ,sid INT NOT NULL
    ,SetUpTime DATE
    ,PRIMARY KEY(userid,sid)
    ,FOREIGN KEY(userid) REFERENCES Seller(userid)
    ,FOREIGN KEY(sid) REFERENCES Store(sid)
);

CREATE TABLE After_Sales_Service_At
(
    brandName VARCHAR(20) NOT NULL
    ,spid INT NOT NULL
    ,PRIMARY KEY(brandName, spid)
    ,FOREIGN KEY(brandName) REFERENCES Brand (brandName)
    ,FOREIGN KEY(spid) REFERENCES ServicePoint(spid)
);



--  -------------------------------------- data insert into table ----------------------------------------------------------------


INSERT INTO users (userid,name,phoneNumber) VALUES (1,'Aarav Patel','809-902-4957');
INSERT INTO users (userid,name,phoneNumber) VALUES (2,'Aanya Gupta','797-156-7733');
INSERT INTO users (userid,name,phoneNumber) VALUES (3,'Vihaan Sharma','857-833-6279');
INSERT INTO users (userid,name,phoneNumber) VALUES (4,'Anaya Singh','102-490-9669');
INSERT INTO users (userid,name,phoneNumber) VALUES (5,'Arjun Kumar','364-220-7833');
INSERT INTO users (userid,name,phoneNumber) VALUES (6,'Ishaan Reddy','577-561-5445');
INSERT INTO users (userid,name,phoneNumber) VALUES (7,'Myra Choudhury','817-736-8954');
INSERT INTO users (userid,name,phoneNumber) VALUES (8,'Reyansh Joshi','500-413-5229');
INSERT INTO users (userid,name,phoneNumber) VALUES (9,'Saanvi Desai','311-237-5037');
INSERT INTO users (userid,name,phoneNumber) VALUES (10,'Aditi Mehta','501-807-7965');
INSERT INTO users (userid,name,phoneNumber) VALUES (11,'Kavya Malhotra','931-805-0046');
INSERT INTO users (userid,name,phoneNumber) VALUES (12,'Rudra Iyer','736-865-1874');
INSERT INTO users (userid,name,phoneNumber) VALUES (13,'Anika Rao','997-968-1425');
INSERT INTO users (userid,name,phoneNumber) VALUES (14,'Aryan Dubey','554-339-3873');
INSERT INTO users (userid,name,phoneNumber) VALUES (15,'Diya Mishra','725-145-0036');
INSERT INTO users (userid,name,phoneNumber) VALUES (16,'Advik Trivedi','627-635-5250');
INSERT INTO users (userid,name,phoneNumber) VALUES (17,'Ishani Bhatt','906-664-4111');
INSERT INTO users (userid,name,phoneNumber) VALUES (18,'Vivaan Kapoor','308-345-2108');
INSERT INTO users (userid,name,phoneNumber) VALUES (19,'Kiara Saxena','794-251-3294');
INSERT INTO users (userid,name,phoneNumber) VALUES (20,'Rohan Agarwal','563-321-0004');
INSERT INTO users (userid,name,phoneNumber) VALUES (21,'Mira Chaturvedi','568-397-1819');
INSERT INTO users (userid,name,phoneNumber) VALUES (22,'Aarush Nair','181-495-6507');
INSERT INTO users (userid,name,phoneNumber) VALUES (23,'Zara Menon','499-991-2743');
INSERT INTO users (userid,name,phoneNumber) VALUES (24,'Veer Shah','619-882-8501');
INSERT INTO users (userid,name,phoneNumber) VALUES (25,'Anvi Bhatia','853-381-3371');
INSERT INTO users (userid,name,phoneNumber) VALUES (26,'Rishi Srinivasan','332-466-8999');
INSERT INTO users (userid,name,phoneNumber) VALUES (27,'Navya Reddy','280-150-3915');
INSERT INTO users (userid,name,phoneNumber) VALUES (28,'Ayaan Khanna','385-898-0420');
INSERT INTO users (userid,name,phoneNumber) VALUES (29,'Prisha Mehra','768-396-9425');
INSERT INTO users (userid,name,phoneNumber) VALUES (30,'Kabir Das','853-688-0957');
INSERT INTO users (userid,name,phoneNumber) VALUES (31,'Neha Verma','926-331-0012');
INSERT INTO users (userid,name,phoneNumber) VALUES (32,'Aarav Seth','661-911-8866');
INSERT INTO users (userid,name,phoneNumber) VALUES (33,'Ananya Bajaj','922-755-8559');
INSERT INTO users (userid,name,phoneNumber) VALUES (34,'Rohan Kapoor','523-845-2705');
INSERT INTO users (userid,name,phoneNumber) VALUES (35,'Ishita Garg','614-499-4578');
INSERT INTO users (userid,name,phoneNumber) VALUES (36,'Vihaan Malhotra','516-139-5882');
INSERT INTO users (userid,name,phoneNumber) VALUES (37,'Myra Iyer','264-976-8713');
INSERT INTO users (userid,name,phoneNumber) VALUES (38,'Reyansh Rao','501-240-1875');
INSERT INTO users (userid,name,phoneNumber) VALUES (39,'Saanvi Dubey','859-284-1514');
INSERT INTO users (userid,name,phoneNumber) VALUES (40,'Aditi Mishra','183-267-5415');
INSERT INTO users (userid,name,phoneNumber) VALUES (41,'Kavya Trivedi','482-150-4868');
INSERT INTO users (userid,name,phoneNumber) VALUES (42,'Rudra Bhatt','634-901-1779');
INSERT INTO users (userid,name,phoneNumber) VALUES (43,'Anika Kapoor','483-164-3378');
INSERT INTO users (userid,name,phoneNumber) VALUES (44,'Aryan Saxena','738-418-4743');
INSERT INTO users (userid,name,phoneNumber) VALUES (45,'Diya Agarwal','539-390-0106');
INSERT INTO users (userid,name,phoneNumber) VALUES (46,'Advik Chaturvedi','953-437-1177');
INSERT INTO users (userid,name,phoneNumber) VALUES (47,'Ishani Nair','640-362-9129');
INSERT INTO users (userid,name,phoneNumber) VALUES (48,'Vivaan Menon','762-486-9320');
INSERT INTO users (userid,name,phoneNumber) VALUES (49,'Kiara Shah','375-164-3524');
INSERT INTO users (userid,name,phoneNumber) VALUES (50,'Rohan Bhatia','346-460-2655');
INSERT INTO users (userid,name,phoneNumber) VALUES (51,'Mira Srinivasan','913-377-4551');
INSERT INTO users (userid,name,phoneNumber) VALUES (52,'Aarush Reddy','693-911-2291');
INSERT INTO users (userid,name,phoneNumber) VALUES (53,'Zara Khanna','238-367-9905');
INSERT INTO users (userid,name,phoneNumber) VALUES (54,'Veer Mehra','284-851-0165');
INSERT INTO users (userid,name,phoneNumber) VALUES (55,'Anvi Das','721-853-4940');
INSERT INTO users (userid,name,phoneNumber) VALUES (56,'Rishi Verma','916-218-1512');
INSERT INTO users (userid,name,phoneNumber) VALUES (57,'Navya Seth','879-742-3407');
INSERT INTO users (userid,name,phoneNumber) VALUES (58,'Ayaan Bajaj','340-319-3768');
INSERT INTO users (userid,name,phoneNumber) VALUES (59,'Prisha Kapoor','908-750-3533');
INSERT INTO users (userid,name,phoneNumber) VALUES (60,'Kabir Garg','801-187-8092');
INSERT INTO users (userid,name,phoneNumber) VALUES (61,'Neha Malhotra','755-909-1768');
INSERT INTO users (userid,name,phoneNumber) VALUES (62,'Aarav Iyer','294-493-0304');
INSERT INTO users (userid,name,phoneNumber) VALUES (63,'Ananya Rao','217-211-8998');
INSERT INTO users (userid,name,phoneNumber) VALUES (64,'Rohan Dubey','984-206-6405');
INSERT INTO users (userid,name,phoneNumber) VALUES (65,'Ishita Mishra','134-482-7453');
INSERT INTO users (userid,name,phoneNumber) VALUES (66,'Vihaan Trivedi','896-641-3132');
INSERT INTO users (userid,name,phoneNumber) VALUES (67,'Myra Bhatt','833-252-1580');
INSERT INTO users (userid,name,phoneNumber) VALUES (68,'Reyansh Kapoor','618-577-5738');
INSERT INTO users (userid,name,phoneNumber) VALUES (69,'Saanvi Saxena','213-729-8239');
INSERT INTO users (userid,name,phoneNumber) VALUES (70,'Aditi Agarwal','847-648-1831');
INSERT INTO users (userid,name,phoneNumber) VALUES (71,'Kavya Chaturvedi','956-194-4659');
INSERT INTO users (userid,name,phoneNumber) VALUES (72,'Rudra Nair','919-463-1871');
INSERT INTO users (userid,name,phoneNumber) VALUES (73,'Anika Menon','593-480-8818');
INSERT INTO users (userid,name,phoneNumber) VALUES (74,'Aryan Shah','193-284-2494');
INSERT INTO users (userid,name,phoneNumber) VALUES (75,'Diya Bhatia','593-876-6529');
INSERT INTO users (userid,name,phoneNumber) VALUES (76,'Advik Srinivasan','393-826-7570');
INSERT INTO users (userid,name,phoneNumber) VALUES (77,'Ishani Reddy','425-483-4304');
INSERT INTO users (userid,name,phoneNumber) VALUES (78,'Vivaan Khanna','281-817-4060');
INSERT INTO users (userid,name,phoneNumber) VALUES (79,'Kiara Mehra','444-315-3902');
INSERT INTO users (userid,name,phoneNumber) VALUES (80,'Rohan Das','384-258-6411');
INSERT INTO users (userid,name,phoneNumber) VALUES (81,'Mira Verma','180-578-2636');
INSERT INTO users (userid,name,phoneNumber) VALUES (82,'Aarush Seth','577-690-7062');
INSERT INTO users (userid,name,phoneNumber) VALUES (83,'Zara Bajaj','914-931-6799');
INSERT INTO users (userid,name,phoneNumber) VALUES (84,'Veer Kapoor','871-337-1836');
INSERT INTO users (userid,name,phoneNumber) VALUES (85,'Anvi Garg','857-195-6423');
INSERT INTO users (userid,name,phoneNumber) VALUES (86,'Rishi Malhotra','412-369-2301');
INSERT INTO users (userid,name,phoneNumber) VALUES (87,'Navya Iyer','493-286-6876');
INSERT INTO users (userid,name,phoneNumber) VALUES (88,'Ayaan Rao','923-883-5069');
INSERT INTO users (userid,name,phoneNumber) VALUES (89,'Prisha Dubey','652-797-0120');
INSERT INTO users (userid,name,phoneNumber) VALUES (90,'Kabir Mishra','202-685-6363');
INSERT INTO users (userid,name,phoneNumber) VALUES (91,'Neha Trivedi','419-663-7344');
INSERT INTO users (userid,name,phoneNumber) VALUES (92,'Aarav Bhatt','990-385-6303');
INSERT INTO users (userid,name,phoneNumber) VALUES (93,'Ananya Kapoor','749-575-5329');
INSERT INTO users (userid,name,phoneNumber) VALUES (94,'Rohan Saxena','231-847-0873');
INSERT INTO users (userid,name,phoneNumber) VALUES (95,'Ishita Agarwal','606-903-9466');
INSERT INTO users (userid,name,phoneNumber) VALUES (96,'Vihaan Chaturvedi','338-386-8025');
INSERT INTO users (userid,name,phoneNumber) VALUES (97,'Myra Nair','146-582-9214');
INSERT INTO users (userid,name,phoneNumber) VALUES (98,'Reyansh Menon','902-263-9357');
INSERT INTO users (userid,name,phoneNumber) VALUES (99,'Saanvi Shah','320-269-9789');
INSERT INTO users (userid,name,phoneNumber) VALUES (100,'Aditi Bhatia','579-713-6386');


INSERT INTO buyer VALUES (5);
INSERT INTO buyer VALUES (41);
INSERT INTO buyer VALUES (18);
INSERT INTO buyer VALUES (12);
INSERT INTO buyer VALUES (24);
INSERT INTO buyer VALUES (16);
INSERT INTO buyer VALUES (17);
INSERT INTO buyer VALUES (85);
INSERT INTO buyer VALUES (56);
INSERT INTO buyer VALUES (66);
INSERT INTO buyer VALUES (33);
INSERT INTO buyer VALUES (28);
INSERT INTO buyer VALUES (9);


INSERT INTO seller VALUES (1);
INSERT INTO seller VALUES (15);
INSERT INTO seller VALUES (30);
INSERT INTO seller VALUES (32);
INSERT INTO seller VALUES (61);
INSERT INTO seller VALUES (63);
INSERT INTO seller VALUES (10);
INSERT INTO seller VALUES (9);
INSERT INTO seller VALUES (4);
INSERT INTO seller VALUES (88);


INSERT INTO address (addrid, userid, name, contactPhoneNumber, province, city, streetaddr, postCode) VALUES
(1, 45, 'Aarav Mehta', '9876543210', 'Maharashtra', 'Mumbai', 'P.O. Box 123, 12 Marine Drive', '400001'),
(2, 12, 'Ishita Sharma', '9823456789', 'Delhi', 'New Delhi', 'P.O. Box 456, 34 Connaught Place', '110001'),
(3, 78, 'Rohan Singh', '9845612378', 'Karnataka', 'Bangalore', 'P.O. Box 789, 56 MG Road', '560001'),
(4, 33, 'Neha Verma', '9812345678', 'West Bengal', 'Kolkata', 'P.O. Box 321, 98 Park Street', '700016'),
(5, 91, 'Vikram Das', '9873214560', 'Tamil Nadu', 'Chennai', 'P.O. Box 654, 45 Anna Salai', '600002'),
(6, 17, 'Priya Nair', '9832145698', 'Kerala', 'Kochi', 'P.O. Box 987, 78 MG Road', '682001'),
(7, 59, 'Aditya Rao', '9898765432', 'Andhra Pradesh', 'Vijayawada', 'P.O. Box 147, 23 Benz Circle', '520010'),
(8, 24, 'Sneha Kulkarni', '9801234567', 'Gujarat', 'Ahmedabad', 'P.O. Box 258, 67 CG Road', '380009'),
(9, 63, 'Rahul Chatterjee', '9887654321', 'Bihar', 'Patna', 'P.O. Box 369, 89 Fraser Road', '800001'),
(10, 8, 'Kavya Iyer', '9810987654', 'Punjab', 'Chandigarh', 'P.O. Box 741, 11 Sector 17', '160017'),
(11, 11, 'Simran Kapoor', '9876543211', 'Maharashtra', 'Pune', 'P.O. Box 123, 5 Baner Road', '411045'),
(12, 22, 'Rajesh Reddy', '9876543222', 'Telangana', 'Hyderabad', 'P.O. Box 456, 10 Banjara Hills', '500034'),
(13, 33, 'Amit Sharma', '9845612389', 'Uttar Pradesh', 'Lucknow', 'P.O. Box 789, 15 Hazratganj', '226001'),
(14, 44, 'Neelam Gupta', '9812345689', 'Rajasthan', 'Jaipur', 'P.O. Box 321, 20 Tonk Road', '302018'),
(15, 55, 'Pankaj Kumar', '9873214570', 'Haryana', 'Gurugram', 'P.O. Box 654, 25 MG Road', '122018'),
(16, 66, 'Ravi Patel', '9832145701', 'Gujarat', 'Vadodara', 'P.O. Box 987, 30 Sayajigunj', '390005'),
(17, 77, 'Shweta Joshi', '9898765443', 'Madhya Pradesh', 'Indore', 'P.O. Box 147, 35 Rajendra Nagar', '452001'),
(18, 88, 'Vikas Thakur', '9801234578', 'Uttarakhand', 'Dehradun', 'P.O. Box 258, 40 Rajpur Road', '248001'),
(19, 99, 'Tarun Mehra', '9887654322', 'Goa', 'Panaji', 'P.O. Box 369, 45 Miramar Beach', '403001'),
(20, 10, 'Divya Singh', '9810987655', 'Punjab', 'Amritsar', 'P.O. Box 741, 50 Golden Temple', '143001'),
(21, 11, 'Jaspreet Kaur', '9876543220', 'Himachal Pradesh', 'Shimla', 'P.O. Box 123, 55 Mall Road', '171001'),
(22, 12, 'Asha Sharma', '9823456790', 'Maharashtra', 'Nagpur', 'P.O. Box 456, 60 Sitabuldi', '440001'),
(23, 13, 'Anil Yadav', '9845612390', 'Uttar Pradesh', 'Kanpur', 'P.O. Box 789, 65 GT Road', '208001'),
(24, 14, 'Sunita Verma', '9812345690', 'Uttarakhand', 'Nainital', 'P.O. Box 321, 70 Mall Road', '263002'),
(25, 15, 'Vikrant Mishra', '9873214571', 'Chhattisgarh', 'Raipur', 'P.O. Box 654, 75 Pandri', '492001'),
(26, 16, 'Kajal Kumari', '9832145702', 'Bihar', 'Gaya', 'P.O. Box 987, 80 Station Road', '823001'),
(27, 17, 'Shalini Yadav', '9898765444', 'Jammu & Kashmir', 'Srinagar', 'P.O. Box 147, 85 Lal Chowk', '190001'),
(28, 18, 'Arvind Kumar', '9801234579', 'Madhya Pradesh', 'Bhopal', 'P.O. Box 258, 90 M.P. Nagar', '462001'),
(29, 19, 'Rupinder Kaur', '9887654323', 'Punjab', 'Ludhiana', 'P.O. Box 369, 95 Fattuwal Road', '141001'),
(30, 20, 'Dinesh Reddy', '9810987656', 'Karnataka', 'Mysuru', 'P.O. Box 741, 100 Ashoka Road', '570001'),
(31, 21, 'Mohan Singh', '9876543230', 'Rajasthan', 'Jaipur', 'P.O. Box 123, 110 Malviya Nagar', '302020'),
(32, 22, 'Ananya Jain', '9823456791', 'Maharashtra', 'Thane', 'P.O. Box 456, 115 Ghodbunder Road', '400615'),
(33, 23, 'Pooja Kumar', '9845612391', 'Uttarakhand', 'Haridwar', 'P.O. Box 789, 120 Har Ki Pauri', '249401'),
(34, 24, 'Vishal Gupta', '9812345691', 'Gujarat', 'Surat', 'P.O. Box 321, 125 Ring Road', '395002'),
(35, 25, 'Anita Sharma', '9873214572', 'Madhya Pradesh', 'Jabalpur', 'P.O. Box 654, 130 Civil Lines', '482001'),
(36, 26, 'Manoj Yadav', '9832145703', 'Bihar', 'Patna', 'P.O. Box 987, 135 Exhibition Road', '800001'),
(37, 27, 'Deepika Verma', '9898765445', 'Haryana', 'Faridabad', 'P.O. Box 147, 140 Sector 15', '121001'),
(38, 28, 'Ajay Reddy', '9801234580', 'Kerala', 'Kochi', 'P.O. Box 258, 145 MG Road', '682001'),
(39, 29, 'Suresh Patel', '9887654324', 'Uttar Pradesh', 'Agra', 'P.O. Box 369, 150 Fatehabad Road', '282001'),
(40, 30, 'Rekha Iyer', '9810987657', 'Maharashtra', 'Navi Mumbai', 'P.O. Box 741, 155 Vashi', '400703'),
(41, 31, 'Ravindra Singh', '9876543231', 'Delhi', 'Noida', 'P.O. Box 123, 160 Sector 18', '201301'),
(42, 32, 'Neelam Kapoor', '9823456792', 'Uttar Pradesh', 'Meerut', 'P.O. Box 456, 165 Hapur Road', '250002'),
(43, 33, 'Shivani Sharma', '9845612392', 'Madhya Pradesh', 'Indore', 'P.O. Box 789, 170 AB Road', '452001'),
(44, 34, 'Harish Yadav', '9812345692', 'Uttarakhand', 'Dehradun', 'P.O. Box 321, 175 Rajpur Road', '248001'),
(45, 35, 'Vandana Joshi', '9873214573', 'Maharashtra', 'Nagpur', 'P.O. Box 654, 180 Wadi', '440008'),
(46, 36, 'Rakesh Kumar', '9832145704', 'Punjab', 'Amritsar', 'P.O. Box 987, 185 Golden Temple Road', '143001'),
(47, 37, 'Shubham Gupta', '9898765446', 'Bihar', 'Patna', 'P.O. Box 147, 190 Dak Bungalow Road', '800001'),
(48, 38, 'Kiran Patel', '9801234581', 'Haryana', 'Ambala', 'P.O. Box 258, 195 Red Cross Road', '134003'),
(49, 39, 'Geeta Rani', '9887654325', 'Uttarakhand', 'Haridwar', 'P.O. Box 369, 200 Brahmakund', '249401'),
(50, 40, 'Rajesh Gupta', '9810987658', 'Madhya Pradesh', 'Jabalpur', 'P.O. Box 741, 205 Ranjhi', '482001'),
(51, 41, 'Sanjay Kumar', '9876543232', 'Rajasthan', 'Udaipur', 'P.O. Box 123, 210 Lake Palace Road', '313001'),
(52, 42, 'Snehal Patel', '9823456793', 'Haryana', 'Gurugram', 'P.O. Box 456, 215 DLF Cyber City', '122002'),
(53, 43, 'Shalini Mehta', '9845612393', 'Madhya Pradesh', 'Bhopal', 'P.O. Box 789, 220 TT Nagar', '462003'),
(54, 44, 'Kunal Yadav', '9812345693', 'Karnataka', 'Mysuru', 'P.O. Box 321, 225 Kuvempunagar', '570023'),
(55, 45, 'Priya Singh', '9873214574', 'Gujarat', 'Rajkot', 'P.O. Box 654, 230 Race Course Road', '360001'),
(56, 46, 'Vikash Reddy', '9832145705', 'Kerala', 'Kochi', 'P.O. Box 987, 235 M.G. Road', '682035'),
(57, 47, 'Nitin Joshi', '9898765447', 'Madhya Pradesh', 'Indore', 'P.O. Box 147, 240 Vijay Nagar', '452010'),
(58, 48, 'Aarti Kumari', '9801234582', 'Rajasthan', 'Jaipur', 'P.O. Box 258, 245 Tonk Road', '302018'),
(59, 49, 'Rakesh Mehra', '9887654326', 'Uttarakhand', 'Dehradun', 'P.O. Box 369, 250 Clement Town', '248002'),
(60, 50, 'Sita Verma', '9810987659', 'Uttar Pradesh', 'Varanasi', 'P.O. Box 741, 255 Dashashwamedh Ghat', '221001'),
(61, 51, 'Manisha Agarwal', '9876543233', 'Maharashtra', 'Pune', 'P.O. Box 123, 260 Shivaji Nagar', '411005'),
(62, 52, 'Ravi Yadav', '9823456794', 'Punjab', 'Ludhiana', 'P.O. Box 456, 265 Fattuwal Road', '141001'),
(63, 53, 'Preeti Kumari', '9845612394', 'Haryana', 'Ambala', 'P.O. Box 789, 270 Red Cross Road', '134003'),
(64, 54, 'Neelam Patel', '9812345694', 'Rajasthan', 'Jodhpur', 'P.O. Box 321, 275 Sojati Gate', '342001'),
(65, 55, 'Karan Kumar', '9873214575', 'Uttarakhand', 'Haridwar', 'P.O. Box 654, 280 Har Ki Pauri', '249401'),
(66, 56, 'Shivani Joshi', '9832145706', 'Madhya Pradesh', 'Bhopal', 'P.O. Box 987, 285 Rishabh Nagar', '462003'),
(67, 57, 'Sandeep Reddy', '9898765448', 'Kerala', 'Kochi', 'P.O. Box 147, 290 MG Road', '682017'),
(68, 58, 'Vijay Mehra', '9801234583', 'Gujarat', 'Ahmedabad', 'P.O. Box 258, 295 S.G. Highway', '380054'),
(69, 59, 'Komal Gupta', '9887654327', 'Uttar Pradesh', 'Agra', 'P.O. Box 369, 300 Fatehabad Road', '282002'),
(70, 60, 'Vikram Mehra', '9810987660', 'Maharashtra', 'Navi Mumbai', 'P.O. Box 741, 305 Vashi', '400703'),
(71, 61, 'Neeraj Reddy', '9876543234', 'Kerala', 'Kochi', 'P.O. Box 123, 310 MG Road', '682018'),
(72, 62, 'Sushila Yadav', '9823456795', 'Madhya Pradesh', 'Indore', 'P.O. Box 456, 315 Bhawar Kuan', '452003'),
(73, 63, 'Nikhil Joshi', '9845612395', 'Rajasthan', 'Jaipur', 'P.O. Box 789, 320 Tonk Road', '302019'),
(74, 64, 'Shanti Verma', '9812345695', 'Uttarakhand', 'Haridwar', 'P.O. Box 321, 325 Har Ki Pauri', '249401'),
(75, 65, 'Alok Kumar', '9873214576', 'Haryana', 'Faridabad', 'P.O. Box 654, 330 Sector 15', '121001'),
(76, 66, 'Tanuja Iyer', '9832145707', 'Punjab', 'Chandigarh', 'P.O. Box 987, 335 Sector 17', '160017'),
(77, 67, 'Amit Yadav', '9898765449', 'Bihar', 'Patna', 'P.O. Box 147, 340 Patliputra Colony', '800013'),
(78, 68, 'Suman Gupta', '9801234584', 'Uttar Pradesh', 'Varanasi', 'P.O. Box 258, 345 Assi Ghat', '221001'),
(79, 69, 'Krishna Reddy', '9887654328', 'Uttarakhand', 'Dehradun', 'P.O. Box 369, 350 Saharanpur Road', '248001'),
(80, 70, 'Vandana Mehra', '9810987661', 'Madhya Pradesh', 'Indore', 'P.O. Box 741, 355 New Palasia', '452001'),
(81, 71, 'Deepak Kumar', '9876543235', 'Haryana', 'Gurugram', 'P.O. Box 123, 360 Cyber City', '122018'),
(82, 72, 'Rajeev Joshi', '9823456796', 'Rajasthan', 'Jaipur', 'P.O. Box 456, 365 Civil Lines', '302001'),
(83, 73, 'Nisha Verma', '9845612396', 'Uttarakhand', 'Dehradun', 'P.O. Box 789, 370 Rajpur Road', '248001'),
(84, 74, 'Shashank Gupta', '9812345696', 'Madhya Pradesh', 'Bhopal', 'P.O. Box 321, 375 Karond', '462001'),
(85, 75, 'Sakshi Patel', '9873214577', 'Gujarat', 'Vadodara', 'P.O. Box 654, 380 Sayajigunj', '390005'),
(86, 76, 'Manoj Joshi', '9832145708', 'Uttarakhand', 'Nainital', 'P.O. Box 987, 385 Mall Road', '263001'),
(87, 77, 'Vishal Mehra', '9898765450', 'Madhya Pradesh', 'Jabalpur', 'P.O. Box 147, 390 Cantonment', '482001'),
(88, 78, 'Kavita Reddy', '9801234585', 'Punjab', 'Amritsar', 'P.O. Box 258, 395 Golden Temple', '143001'),
(89, 79, 'Jagdish Singh', '9887654329', 'Bihar', 'Patna', 'P.O. Box 369, 400 Buddha Marg', '800001'),
(90, 80, 'Rajesh Kumar', '9810987662', 'Haryana', 'Ambala', 'P.O. Box 741, 405 Model Town', '134003'),
(91, 81, 'Neha Mehta', '9876543236', 'Kerala', 'Thiruvananthapuram', 'P.O. Box 123, 410 MG Road', '695001'),
(92, 82, 'Ravi Verma', '9823456797', 'Rajasthan', 'Udaipur', 'P.O. Box 456, 415 Saheli Marg', '313001'),
(93, 83, 'Kiran Yadav', '9845612397', 'Uttar Pradesh', 'Agra', 'P.O. Box 789, 420 Kamla Nagar', '282001'),
(94, 84, 'Pradeep Joshi', '9812345697', 'Madhya Pradesh', 'Gwalior', 'P.O. Box 321, 425 Lashkar', '474001'),
(95, 85, 'Manisha Singh', '9873214578', 'Haryana', 'Faridabad', 'P.O. Box 654, 430 Sector 15', '121001'),
(96, 86, 'Amit Sharma', '9832145709', 'Maharashtra', 'Pune', 'P.O. Box 987, 435 Shivaji Nagar', '411005'),
(97, 87, 'Nandini Verma', '9898765451', 'Punjab', 'Chandigarh', 'P.O. Box 147, 440 Sector 42', '160042'),
(98, 88, 'Sandeep Yadav', '9801234586', 'Gujarat', 'Ahmedabad', 'P.O. Box 258, 445 SG Highway', '380014'),
(99, 89, 'Geeta Kumari', '9887654330', 'Madhya Pradesh', 'Indore', 'P.O. Box 369, 450 MG Road', '452001'),
(100, 90, 'Vijay Yadav', '9810987663', 'Haryana', 'Gurugram', 'P.O. Box 741, 455 Sector 29', '122001');


INSERT INTO bankcard VALUES('4023 1231 3431 8623', '2039-9-10','HDFC Bank');
INSERT INTO bankcard VALUES('5872 8293 3321 0123', '2020-5-14','SBI');
INSERT INTO bankcard VALUES('4902 9212 3402 8831', '2027-7-01','ICICI Bank');
INSERT INTO bankcard VALUES('5782 7293 8472 0318', '2028-8-15','Axis Bank');
INSERT INTO bankcard VALUES('4509 4462 9302 0716', '2030-1-30','HDFC Bank');
INSERT INTO bankcard VALUES('8473 9299 8492 7361', '2024-6-20','SBI');
INSERT INTO bankcard VALUES('4457 4992 7391 0219', '2025-8-30','SBI');
INSERT INTO bankcard VALUES('5728 8391 7362 5381', '2035-5-20','ICICI Bank');
INSERT INTO bankcard VALUES('7283 8982 8361 5593', '2029-4-14','Axis Bank');
INSERT INTO bankcard VALUES('9238 2749 5738 5921', '2027-8-01','HDFC Bank');
INSERT INTO bankcard VALUES('2839 8219 3728 2933', '2031-5-20','ICICI Bank');


INSERT INTO creditcard VALUES('4902 9212 3402 8831',5,'VISA');
INSERT INTO creditcard VALUES('4023 1231 3431 8623',18,'MASTER');
INSERT INTO creditcard VALUES('8473 9299 8492 7361',41,'VISA');
INSERT INTO creditcard VALUES('7283 8982 8361 5593',24,'VISA');
INSERT INTO creditcard VALUES('9238 2749 5738 5921',12,'MASTER');
INSERT INTO creditcard VALUES('2839 8219 3728 2933',9,'VISA');

INSERT INTO debitcard VALUES('5872 8293 3321 0123', 15);
INSERT INTO debitcard VALUES('5728 8391 7362 5381', 30);
INSERT INTO debitcard VALUES('4457 4992 7391 0219', 32);
INSERT INTO debitcard VALUES('5782 7293 8472 0318', 1);
INSERT INTO debitcard VALUES('4509 4462 9302 0716', 3);


INSERT INTO store VALUES(8,'Choby Collection','Maharashtra','Mumbai','No.2012 Sanguinet',4,'2006-5-30');
INSERT INTO store VALUES(10,'BestBuy','Delhi','New Delhi','No.20 ShineStreet',5,'2002-8-05');
INSERT INTO store VALUES(39,'CoolGuy','Maharashtra','Mumbai','No.1023 St-Catherine',3,'2012-2-24');
INSERT INTO store VALUES(77,'Your Favorite','Karnataka','Bangalore','No.3022 Saint Denis',4,'2015-7-25');
INSERT INTO store VALUES(218,'American Eagle','Maharashtra','Pune','No.5 Berri Street',2,'2004-11-17');

INSERT INTO Brand VALUES('Asus');
INSERT INTO Brand VALUES('acer');
INSERT INTO Brand VALUES('Canon');
INSERT INTO Brand VALUES('DELL');
INSERT INTO Brand VALUES('apple');
INSERT INTO Brand VALUES('Microsoft');

INSERT INTO ServicePoint VALUES(27,'2045 MG Road','Mumbai','Maharashtra','10:00 am','5:30 pm');
INSERT INTO ServicePoint VALUES(72,'37 Brigade Road','Bangalore','Karnataka','9:30 am','5:30 pm');
INSERT INTO ServicePoint VALUES(34,'45 Connaught Place','New Delhi','Delhi','10:00 am','6:00 pm');
INSERT INTO ServicePoint VALUES(19,'1099 University Road','Chandigarh','Punjab','10:00 am','5:30 pm');
INSERT INTO ServicePoint VALUES(9,'27 Park Street','Kolkata','West Bengal','10:00 am','5:30 pm');
INSERT INTO ServicePoint VALUES(5,'27 Park Street','chennai','south india','10:00 am','5:30 pm');


SET SQL_SAFE_UPDATES = 0;


INSERT INTO Product VALUES(1,8,'Asus','ASUS Chromebook 11.6 laptop','laptop','C201PA-DS02','navy blue',10,262);
INSERT INTO Product VALUES(2,10,'acer','Acer QuietComfort 35 wireless headphone','headphone','759944-0010','black',100,449);
INSERT INTO Product VALUES(3,39,'Canon','Canon EOS Rebel T5','cameras','9126B003','black',50,500);
INSERT INTO Product VALUES(4,77,'DELL','DELL Ultra HD 4k Monitor P2715Q 27-Inch Screen LED-Lit Monitor','computer accessories','P2715Q','black',40,713);
INSERT INTO Product VALUES(5,218,'Apple','Apple HERO5','cameras','CHDHX-501-CA','black',80,599);
INSERT INTO Product VALUES(6,218,'Microsoft','Microsoft Xbox 360 Wired Controller for Windows','controllers','52A-00004','black',60,35);
INSERT INTO Product VALUES(7,8,'Microsoft','Microsoft Sculpt Ergonomic Wireless Bluetrack Desktop Keyboard','computer accessories','L5V-00003','black',70,126);
INSERT INTO Product VALUES(8,8,'Microsoft','Microsoft Surface Pro 4 i5 (128GB) with Wireless Media Adapter','laptop','CR5-00001','black',30,1350);

INSERT INTO OrderItem VALUES(1,1,262,'2016-09-18');
INSERT INTO OrderItem VALUES(2,2,449,'2014-03-22');
INSERT INTO OrderItem VALUES(3,3,500,'2017-01-23');
INSERT INTO OrderItem VALUES(4,4,713,'2017-01-23');
INSERT INTO OrderItem VALUES(5,5,599,'2016-12-27');
INSERT INTO OrderItem VALUES(6,6,35,'2015-05-30');
INSERT INTO OrderItem VALUES(7,7,126,'2017-02-12');
INSERT INTO OrderItem VALUES(8,8,1350,'2016-12-27');
INSERT INTO OrderItem VALUES(9,1,262,'2015-02-13');
INSERT INTO OrderItem VALUES(10,5,599,'2015-08-22');

INSERT INTO Comments VALUES('2017-02-21',5,1,4.3,'The laptop works amazingly. It holds a 10 hour charge, is compact to wander with, the brightness/volume features are perfect.');
INSERT INTO Comments VALUES('2016-09-18',5,2,4.6,'These headphones are worth the money, yes even the CAD price. They sound good and the noise cancellation is incredible.');
INSERT INTO Comments VALUES('2014-03-22',12,3,4.7,'Someone always has a better camera. That being said, this is an admirable performer with enough features for most.');
INSERT INTO Comments VALUES('2017-01-23',12,4,4.8,'This monitor is simply amazing. My eyes are not getting any younger and this makes everything very crisp and clear. I can definitely notice the improvement over a 2560X1440 display. I am ordering another one!');
INSERT INTO Comments VALUES('2016-12-27',18,5,4.3,'It is the first Go Pro I have had and so far I am loving it, the voice control is great for when you have your hands busy or can not reach the buttons. The apps for camera pairing and video editing are just great as well');
INSERT INTO Comments VALUES('2015-05-30',24,6,4.5,'Works flawlessly. After plugging it in, Windows automatically installed the drivers for it, and it was working in a matter of moments. It is an actual Xbox controller so it feels solid. This was definitely a purchase I would make again.');
INSERT INTO Comments VALUES('2017-02-12',41,7,4.3,'Overall good keyboard and mouse. However the moment your USB receiver dies, the whole thing goes in the garbage.');
INSERT INTO Comments VALUES('2016-12-27',41,8,3.8,'I love my surface. I got it a couple of weeks ago. I amm a life time mac user, but I consider myself quite tech savvy. I think this is a great device.');
INSERT INTO Comments VALUES('2015-05-30',12,2,4.3,'I have been using it for a week now. For a short conclusion, i love the headset.');
INSERT INTO Comments VALUES('2015-08-22',18,1,5,'This was definitely an impulse buy on my part but has turned out to be one of the best things I have ever invested in for school!');
INSERT INTO Comments VALUES('2015-08-22',24,5,5,'First go pro I have ever purchased. Really impressed with the quality and ease of use. The stabilizer is awesome, do not need to warp stabilize a ton in adobe.');

INSERT INTO Save_to_Shopping_Cart VALUES(5,1,'2017-02-21',1);
INSERT INTO Save_to_Shopping_Cart VALUES(5,2,'2016-09-18',1);
INSERT INTO Save_to_Shopping_Cart VALUES(18,3,'2014-03-22',2);
INSERT INTO Save_to_Shopping_Cart VALUES(12,4,'2017-01-23',1);
INSERT INTO Save_to_Shopping_Cart VALUES(24,5,'2016-12-27',2);
INSERT INTO Save_to_Shopping_Cart VALUES(41,6,'2015-05-30',1);
INSERT INTO Save_to_Shopping_Cart VALUES(9,7,'2016-02-19',4);
INSERT INTO Save_to_Shopping_Cart VALUES(18,8,'2012-01-20',1);


INSERT INTO Manage VALUES(1,8,'2015-12-24');
INSERT INTO Manage VALUES(15,10,'2006-03-20');
INSERT INTO Manage VALUES(30,39,'2006-08-09');
INSERT INTO Manage VALUES(32,77,'2005-03-04');
INSERT INTO Manage VALUES(1,218,'2010-05-06');

INSERT INTO After_Sales_Service_At VALUES('Asus',27);
INSERT INTO After_Sales_Service_At VALUES('Microsoft',27);
INSERT INTO After_Sales_Service_At VALUES('DELL',72);
INSERT INTO After_Sales_Service_At VALUES('Microsoft',34);
INSERT INTO After_Sales_Service_At VALUES('acer',34);
INSERT INTO After_Sales_Service_At VALUES('Microsoft',19);
INSERT INTO After_Sales_Service_At VALUES('Canon',19);
INSERT INTO After_Sales_Service_At VALUES('Microsoft',9);
INSERT INTO After_Sales_Service_At VALUES('DELL',9);
INSERT INTO After_Sales_Service_At VALUES('Apple',9);


INSERT INTO Orders VALUES(76023921,'Paid','2016-09-18',315);
INSERT INTO Orders VALUES(23924831,'Paid','2014-03-22',174);
INSERT INTO Orders VALUES(87291231,'Unpaid','2017-01-23',102);
INSERT INTO Orders VALUES(58293123,'Unpaid','2016-12-27',928);
INSERT INTO Orders VALUES(12992012,'Paid','2015-05-30',203);
INSERT INTO Orders VALUES(59203012,'Paid','2017-02-12',87);
INSERT INTO Orders VALUES(91027482,'Unpaid','2016-12-27',187);
INSERT INTO Orders VALUES(72839301,'Unpaid','2015-02-13',293);
INSERT INTO Orders VALUES(93042135,'Paid','2015-08-22',52);
INSERT INTO Orders VALUES(74892932,'UnPaid','2016-02-19',77);
INSERT INTO Orders VALUES(83921201,'Paid','2017-01-03',301);
INSERT INTO Orders VALUES(73919231,'Paid','2014-02-11',20);
INSERT INTO Orders VALUES(84821231,'Paid','2014-11-02',18);

INSERT INTO Contain VALUES(76023921,1,1);
INSERT INTO Contain VALUES(76023921,2,2);
INSERT INTO Contain VALUES(23924831,3,1);
INSERT INTO Contain VALUES(87291231,4,2);
INSERT INTO Contain VALUES(58293123,5,1);
INSERT INTO Contain VALUES(12992012,6,1);
INSERT INTO Contain VALUES(12992012,7,1);
INSERT INTO Contain VALUES(59203012,8,1);
INSERT INTO Contain VALUES(91027482,9,1);
INSERT INTO Contain VALUES(72839301,10,1);
INSERT INTO Contain VALUES(93042135,1,1);
INSERT INTO Contain VALUES(93042135,2,1);
INSERT INTO Contain VALUES(93042135,3,1);
INSERT INTO Contain VALUES(82921201,4,3);
INSERT INTO Contain VALUES(84821231,5,3);
INSERT INTO Contain VALUES(73919231,6,2);
INSERT INTO Contain VALUES(83921201,7,5);

INSERT INTO deliver_to VALUES(39,87291231,'2017-02-17');
INSERT INTO deliver_to VALUES(1,12992012,'2015-6-10');
INSERT INTO deliver_to VALUES(7,76023921,'2015-10-04');
INSERT INTO deliver_to VALUES(12,59203012,'2017-02-20');
INSERT INTO deliver_to VALUES(14,93042135,'2015-09-08');


INSERT INTO Payment VALUES(23924831,'4902 9212 3402 8831','2016-08-23');
INSERT INTO Payment VALUES(87291231,'4023 1231 3431 8623','2016-08-07');
INSERT INTO Payment VALUES(58293123,'8473 9299 8492 7361','2016-09-07');
INSERT INTO Payment VALUES(12992012,'7283 8982 8361 5593','2015-02-23');
INSERT INTO Payment VALUES(59203012,'9238 2749 5738 5921','2013-09-07');
INSERT INTO Payment VALUES(91027482,'4902 9212 3402 8831','2017-02-01');
INSERT INTO Payment VALUES(72839301,'4902 9212 3402 8831','2016-10-23');
INSERT INTO Payment VALUES(93042135,'4023 1231 3431 8623','2016-10-07');
INSERT INTO Payment VALUES(91027482,'7283 8982 8361 5593','2017-02-01');
INSERT INTO Payment VALUES(84821231,'9238 2749 5738 5921','2017-01-23');
INSERT INTO Payment VALUES(73919231,'9238 2749 5738 5921','2016-10-23');
INSERT INTO Payment VALUES(83921201,'9238 2749 5738 5921','2017-02-01');

