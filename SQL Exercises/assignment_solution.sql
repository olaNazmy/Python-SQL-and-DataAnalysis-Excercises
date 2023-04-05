-- 1. Select the orderId with the 2nd highest quantity
select OrderID, Quantity
from order_details 
order by Quantity desc
limit 1
offset 1;

-- 2. Select the Customer ID with the 3rd highest quantity
select OrderID, Quantity
from order_details 
order by Quantity desc
limit 1
offset 2;

-- 3. Get the category name with that their number of products > 10
select c.CategoryName,count( p.ProductName) as num_products
from products p
join categories c
on p.CategoryID = c.CategoryID
group by c.CategoryID
having count( p.ProductName) > 10;

-- 4. Get the category name with the highest number of products
select c.CategoryName,count( p.ProductName) as num_products
from products p
join categories c
on p.CategoryID = c.CategoryID
group by c.CategoryID
order by count( p.ProductName) desc 
limit 1;

-- 5. Find all customers names and postal code that their name begins 
-- with an a and live in Mexico
 select * 
 from customers 
 where PostalCode like 'a%'
 and Country = 'Mexico';
 
 -- 6. Get employees that hold phd
 select * 
 from employees
 where Notes like '%Ph.D%';
 
 -- 7. Get suppliers names who supply tofu
select s.SupplierName, p.ProductName
from products p
join suppliers s
on p.SupplierID = s.SupplierID 
where p.ProductName like "%tofu%";

-- 8. Get the top 3 products by price names which their price is larger 
-- than 10 and less than 30 and are measured in boxes

select ProductName, Price
from products
where (Price > 10 and Price < 30) and Unit like "%boxes%"
order by Price desc
limit 3;
