--���K���-SQL2-���W


--1.CREATE
CREATE TABLE sales_old(
sales_id int primary key,
order_date date,
customer_id int not null references customer(customer_id),
amount decimal);


--2.INSERT
INSERT INTO sales_old VALUES (6,'2018/09/02',2,20000), 
                             (7,'2018/09/02',1,5000), 
                             (8,'2018/09/02',3,6000), 
                             (9,'2018/09/05',1,3000);


--3.INSERT�ASELECT
INSERT INTO sales
SELECT * FROM sales_old;


--4.DROP
DROP TABLE sales_old;


--5.CASE WHEN�A�ʖ�
SELECT sales_id, order_date,
    (CASE WHEN order_date < '2018/10/01' THEN '�Z'
          ELSE ' ' END) AS is_old
FROM sales
ORDER BY order_date;


--6.�����񌋍��A�ʖ�
SELECT customer_id || ':' || customer_name AS customer_id_name
FROM customer;


--7.LIMIT
SELECT * FROM sales
WHERE customer_id = 1
ORDER BY order_date DESC 
LIMIT 2;


--8.GROUP BY�AMIN�ASUM�A�T�u�N�G���A�ʖ�
SELECT order_date, sum(amount) AS sum_amount
FROM sales
GROUP BY order_date
HAVING order_date = (SELECT min(order_date)
                    FROM sales);


--9.GROUP BY�AJOIN�AAVG�ATRUNC�A�ʖ�
SELECT s.customer_id, c.customer_name, TRUNC(avg(s.amount)) AS avg_amount
FROM sales s
INNER JOIN customer c ON s.customer_id = c.customer_id
GROUP BY c.customer_name, s.customer_id
ORDER BY customer_id;


--10.BETWEEN�ALIMIT�A�T�u�N�G��
SELECT *
FROM sales
WHERE sales_id = (SELECT sales_id
                  FROM sales
                  WHERE order_date BETWEEN '2018/09/01' AND '2018/09/30'
                  ORDER BY amount DESC
                  LIMIT 1);

