create database sql_portfolio;
use sql_portfolio;

-- Retrive books in the"Fiction" genre
select * from books
where genre='Fiction';

-- Find books publisher after the year 1950
select * from books
where Published_Year>1950;

-- List all customers from Canada
select * from customers
where country='Canada';

-- Show orders placed in november 2023
Select * from orders
where Order_Date between '2023-11-01' and '2023-11-30';

-- Retrive the total stocks of books available
 select SUM(Stock) as Total_Stock from books;
 
 -- Find the detail of most expensive book
 select * from books
 where price = (Select MAX(Price) from books);
-- OR
SELECT * from books
order by price DESC
limit 1;
 
 -- Show all customers who ordered more than one quantity of books
 Select * from orders
 where Quantity>1;
 
 -- Retrieve all orders where the total amount exceeds $20
 Select * from orders
 where Total_Amount>20;
 
 -- List all genres available in the book table
 Select Genre from books;
 
 -- Find the book with lowest stock.
 Select * from books
 where Stock = (Select MIN(Stock) from books);
-- or
select * from books
 order by Stock
 limit 1;
 
 -- Calculate the total revenue generated from all the orders.
 Select SUM(Total_Amount) AS Renenue
 from orders;
 
