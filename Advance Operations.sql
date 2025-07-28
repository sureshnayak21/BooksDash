create database sql_portfolio;
use sql_portfolio;

-- retrive the total number of books sold for each genre
select Genre, SUM(Quantity) as Total_Quantity from books
left join orders
on books.Book_ID=orders.Book_ID
group by Genre;

-- Find the average price of books in the 'Fantasy' genre
Select Genre, AVG(Price) from books
where Genre='Fantasy';

-- List customer who had placed atleast 2 orders
Select c.Customer_ID, c.Name, Count(o.Order_ID) as Order_count 
from orders o
join customers c on o.Customer_ID = c.Customer_ID
group by o.Customer_ID, c.Name
having count(Order_ID)>=2;

-- Find the most frequently ordered books.
Select o.Book_ID, b.Title , COUNT(o.Order_ID) as Order_count 
from orders o
left join books b
on o.Book_ID=b.Book_ID
group by o.Book_ID, b.Title
order by Order_count desc
limit 1;

 -- Show the top 3 most expensive books of 'Fantasy' Genre
 select * from books
 where Genre='Fantasy'
 Order by Price Desc
 limit 3;
 
 -- Retrive the total quantity of books sold by each author.
 Select b.Author, SUM(o.Quantity) as Total_Quantity
 from orders o
 join books b 
 on o.Book_ID=b.Book_ID
 group by b.Author;
 
  -- List the cities where customers who spent over $30 are located
  Select c.City, o.Total_Amount
  from orders o
  join customers c
  on o.Customer_ID=c.Customer_ID
  where o.Total_Amount>30;
  
-- Find the customer who spent the most on orders
Select c.Customer_ID, c.Name, Sum(o.Total_Amount) as Total_Spent 
from orders o
join customers c on o.Customer_ID=c.Customer_ID
Where Total_Amount = (Select max(o.Total_Amount) from orders)
Group by c.Name,c.Customer_ID
order by Total_Spent DESC
limit 1;

  -- Calculate the stock remaining after fulfilling all orders
Select b.Book_ID, b.Title,b.Stock, Coalesce(SUM(o.Quantity),0) as Order_Quantity, b.Stock - Coalesce(SUM(o.Quantity),0) as Stock_Remaining
from books b
join orders o
on b.Book_ID=o.Book_ID
Group by b.Book_ID
order by b.Book_ID;