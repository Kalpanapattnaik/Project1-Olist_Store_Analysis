use olist;

-- KPI 1 : Weekday Vs Weekend (order_purchase_timestamp) Payment Statistics

SELECT CASE WHEN WEEKDAY(a.order_purchase_timestamp)=5 OR
WEEKDAY(a.order_purchase_timestamp)=6  then "Weekend"
ELSE "Weekday" end as daystatus,  CONCAT('$   ', ROUND(SUM(b.payment_value))) AS payment_statistics,
CONCAT(ROUND(SUM(b.payment_value) / (SELECT SUM(payment_value) FROM olist_order_payments_dataset) * 100, 2), '%') AS percentage_of_total
FROM olist_orders_dataset a JOIN olist_order_payments_dataset b ON a.order_id=b.order_id
GROUP BY daystatus;

SELECT t1.day_week, 
		CONCAT('$   ', CAST(SUM(t2.payment_value) AS DECIMAL(10,0))) AS total_payment,
		CONCAT(ROUND(SUM(t2.payment_value) / (SELECT SUM(payment_value) FROM olist_order_payments_dataset) * 100, 2), '%') AS percentage_of_total
FROM olist_orders_dataset t1
JOIN olist_order_payments_dataset t2 ON t1.order_id = t2.order_id
GROUP BY t1.day_week;

-- KPI 2 : Number of Orders with review score 5 and payment type as credit card.

SELECT COUNT(r.order_id) AS order_count
FROM olist_order_reviews_dataset r
JOIN olist_order_payments_dataset p ON r.order_id = p.order_id
WHERE r.review_score = 5 AND p.payment_type = 'credit_card';	


-- KPI 3 : Average number of days taken for order_delivered_customer_date for pet_shop

SELECT ROUND(AVG(days)) as Avg_day FROM(
SELECT DATEDIFF(a.order_delivered_customer_date,a.order_purchase_timestamp) AS days ,c.product_category_name
FROM olist_orders_dataset a JOIN olist_order_items_dataset b JOIN  olist_products_dataset c ON a.order_id=b.order_id AND b.product_id=c.product_id
WHERE c.product_category_name='pet_shop') AS dt ;

-- KPI 4 : Average price and payment values from customers of sao paulo city

SELECT ROUND(AVG(a.price),2) AS avg_price, ROUND(AVG(b.payment_value),2) AS avg_paymentvalue,c.customer_city
FROM olist_orders_dataset d JOIN olist_customers_dataset c JOIN olist_order_payments_dataset b JOIN olist_order_items_dataset a 
ON d.customer_id=c.customer_id AND d.order_id=b.order_id AND d.order_id=a.order_id WHERE c.customer_city = 'sao paulo';

-- KPI 5 :  Relationship between shipping days (order_delivered_customer_date - order_purchase_timestamp) Vs review scores.

SELECT  r.review_score , ROUND(AVG(DATEDIFF (order_delivered_customer_date,order_purchase_timestamp))) AS Avg_shipping_days 
FROM olist_orders_dataset o JOIN olist_order_reviews_dataset r 
ON o.order_id=r.order_id GROUP BY review_score ORDER BY review_score desc;

