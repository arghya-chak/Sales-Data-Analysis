### Data Analysis Using SQL

# Show all customer records
SELECT * 
FROM customers;

# Show total number of customers
SELECT count(*) 
FROM customers;

# Show transactions for Chennai market (market code for Chennai is Mark001)
SELECT * 
FROM transactions 
WHERE market_code='Mark001';

# Show distinct product codes that were sold in Chennai
SELECT DISTINCT product_code 
FROM transactions 
WHERE market_code='Mark001';

# Show transactions where currency is USD
SELECT * 
FROM transactions 
WHERE currency="USD";

# Show transactions in 2020 join by date table
SELECT * 
FROM transactions 
INNER JOIN date 
ON transactions.order_date = date.date 
WHERE date.year = 2020;

# Show total revenue in INR in year 2019
SELECT SUM(t.sales_amount_INR) 
FROM (SELECT transactions.order_date, 
	     IF(transactions.currency = "INR", transactions.sales_amount, transactions.sales_amount*83.5) AS sales_amount_INR
      FROM transactions) AS t
INNER JOIN date 
ON t.order_date = date.date 
WHERE date.year = 2019;
	
# Show total revenue in INR in May 2018
SELECT SUM(t.sales_amount_INR) 
FROM (SELECT transactions.order_date, 
             IF(transactions.currency = "INR", transactions.sales_amount, transactions.sales_amount*83.5) AS sales_amount_INR
      FROM transactions) AS t
INNER JOIN date 
ON t.order_date = date.date 
WHERE date.year = 2018
AND date.month_name = "May";

# Show total revenue in INR in year 2019 in Chennai
SELECT SUM(t.sales_amount_INR) 
FROM (SELECT transactions.order_date, transactions.market_code, 
	     IF(transactions.currency = "INR", transactions.sales_amount, transactions.sales_amount*83.5) AS sales_amount_INR
      FROM transactions) AS t
INNER JOIN date 
ON t.order_date = date.date 
WHERE date.year = 2019
AND t.market_code = "Mark001";



