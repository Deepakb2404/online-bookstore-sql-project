--Q1. Retrieve all books in the 'Fiction' genre:
SELECT * FROM Books
WHERE Genre = 'Fiction';

--Q2. Find books published after the year 1950:
SELECT * FROM Books
WHERE Published_year > 1950;


SELECT *  FROM Books;
--Q3. List all customer from the canada:
SELECT * FROM customers
WHERE Country = 'Canada';

--Q4. Show order placed in November 2023:
SELECT * FROM Orders
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

--Q5. Retrieve the total stock of books available:
SELECT SUM(stock) AS Total_stock
FROM Books;

--Q6.  Find the details of most expensive book:
SELECT * FROM Books
ORDER BY price DESC
LIMIT 1;

--Q7. Show all customer who ordered more than 1 quantity of a book:
SELECT * FROM Orders
WHERE quantity>1;

--Q8. Retrieve all orders where the total amount exceed $20:
SELECT * FROM Orders
WHERE total_amount>20;

--Q9. List all the genres available in books table:
SELECT DISTINCT genre
FROM Books;

--Q10. Find the book with the lowest stock:
SELECT * FROM Books
ORDER BY Stock ASC
LIMIT 5;

--Q11. Calculate the total revenue generated from all orders:
SELECT SUM(total_amount) AS Revenue
FROM ORDERS;

--Q12. Retrieve the total number of books sold for each genre:
SELECT b.genre, SUM(O.quantity) AS Total_Books_Sold
FROM Orders O
JOIN Books b 
ON O.Book_ID = b.Book_ID
GROUP BY b.Genre;

--Q13. Find the average price of books in the 'Fantasy' genre:
SELECT AVG(price) AS Avg_Price FROM Books
WHERE genre='Fantasy';

--Q14. List customers who have placed atleast 2 Order:
SELECT o.customer_id, c.cust_name, COUNT(o.Order_id) AS Order_count
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY o.customer_id, c.cust_name
HAVING COUNT(Order_id)>=2;

--Q15. Find the most frequently ordered book:
SELECT o.Book_id, b.title, COUNT(order_id) AS Order_count
FROM Orders o
JOIN books b ON o.book_id = b.book_id
GROUP BY o.Book_id, b.title
ORDER BY Order_count DESC LIMIT 1;

--Q16. Show the top 3 most expensive books of 'Fantasy' Genre:
SELECT * FROM Books
WHERE Genre = 'Fantasy'
ORDER BY price DESC LIMIT 3;

--Q17. Retrieve the total quantity of books sold by each Author:
SELECT b.author, SUM(o.quantity) AS Total_Books_Sold
FROM orders o
JOIN Books b ON o.book_id = b.book_id
GROUP BY b.Author;

--Q18. List the cities where customers who spent over $30 are located:
SELECT DISTINCT c.city, total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.total_amount > 30;

--Q19. Find the customers who spend most on orders:
SELECT c.customer_id, c.cust_name, SUM(o.total_amount) AS Total_spends
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.cust_name
ORDER BY Total_spends DESC;

--Q20. Calculate the stock remaining after fulfilling all order.
SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity), 0) AS Order_quantity, 
b.stock - COALESCE(SUM(o.quantity), 0) AS remaining_quantity
FROM books b
LEFT JOIN orders o ON b.book_id = o.book_id
GROUP BY b.book_id;