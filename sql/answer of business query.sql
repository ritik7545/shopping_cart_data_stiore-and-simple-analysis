-- query the information of laptops
SELECT *
FROM Product
WHERE type='laptop';


-- query the total quantity of products from store with storeid 8 in the shopping cart
SELECT SUM(quantity) AS totalQuantity
FROM Save_to_Shopping_Cart
WHERE Save_to_Shopping_Cart.pid IN (SELECT Product.pid FROM Product WHERE sid=8);

-- query the name and address of orders delivered on 2017-02-17
SELECT name, streetaddr, city
FROM Address
WHERE addrid IN (SELECT addrid FROM Deliver_To WHERE TimeDelivered = '2017-02-17');

 -- query the comments of product 1 
SELECT *
FROM Comments
WHERE pid = 1;

-- Insert the user id of sellers whose name starts with A into buyer
INSERT INTO buyer
SELECT * FROM seller
WHERE userid IN (SELECT userid FROM users WHERE name LIKE 'A%');

-- Update the payment state of orders to unpaid which created after year 2017 and with total amount greater than 50.
UPDATE Orders
SET paymentState = 'Unpaid'
WHERE creationTime > '2017-01-01' AND totalAmount > 50;

-- Update the name and contact phone number of address where the provice is Maharashtra and city is mumbai.
UPDATE address
SET name = 'Ritik sah ', contactPhoneNumber ='7984548475'
WHERE province = 'Maharashtra' AND city = 'mumbai';

-- Delete the store which opened before year 2015
DELETE FROM save_to_shopping_cart
WHERE addTime < '2015-01-01';

-- List all users with their associated address information.
SELECT users.name, address.streetaddr, address.city, address.postcode
FROM users
JOIN address ON users.userid = address.userid;



