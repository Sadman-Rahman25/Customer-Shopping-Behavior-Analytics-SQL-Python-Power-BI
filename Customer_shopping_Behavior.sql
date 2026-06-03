--select * from customer limit 20


--1 Total revenue male vs female customers
select gender, sum(purchase_amount) as revenue
from customer
group by gender

--2 which customers used a discount but still spent more than the average purchase amount
select customer_id, purchase_amount
from customer
where discount_applied='Yes' and purchase_amount>=(select AVG(purchase_amount) from customer)

--3 which are the top 5 product with the highest average review rating
select item_purchased, (AVG(review_rating) as "average review rating"
from customer
group by item_purchased
order by avg(review_rating) desc
limit 5;

--4 compare the avg purchase amounts between standard and express shipping
select ROUND(AVG(purchase_amount), 2),shipping_type
from customer
where shipping_type in ('Standard', 'Express')
group by shipping_type

--5 Do subscribed Customers spend more? Compare avg spend and total revenue between subscribers and non-subscribers
select subscription_status,
ROUND(AVG(purchase_amount),2) AS AVG_SPENT,
SUM(purchase_amount) AS TOTAL_REVENUE,
COUNT (customer_id) as total_customers
from customer
group by subscription_status
order by TOTAL_REVENUE, AVG_SPENT desc;


--6 which 5 product has the highest percentage of purchases with discount applied?
select item_purchased,
ROUND(100 * sum(case when discount_applied='Yes' then 1 else 0 end)/count(*),2) as discount_rate
from customer
group by item_purchased
order by discount_rate DESC
limit 5;

-- 7 Segment customers into new, returning, and loyal customers
WITH customer_type AS (
    SELECT 
        customer_id,
        previous_purchases,
        CASE 
            WHEN previous_purchases = 1 THEN 'NEW'
            WHEN previous_purchases BETWEEN 2 AND 10 THEN 'RETURNING'
            ELSE 'LOYAL'
        END AS customer_segment
    FROM customer
)
SELECT 
    customer_segment,
    COUNT(*) AS customer_count
FROM customer_type
GROUP BY customer_segment;

--8 WHAT ARE THE TOP 3 MOST PURCHASED PRODUCTS WITHIN EACH CATAGORY
WITH item_counts as(
select category, item_purchased, count(customer_id) as total_orders,
ROW_NUMBER() OVER(PARTITION By category order by count(customer_id) DESC) as item_rank
FROM customer
group by category, item_purchased
)
select item_rank,category, item_purchased, total_orders
from item_counts
where item_rank<=3;

--9 Are customers whho are repeat buyers (more thar 5 previous purchase) also likely to subscribe?
select subscription_status, Count(customer_id) as repeat_buyers
from customer
where previous_purchases>=5
group by subscription_status

--10 What is the revenue contribution of each age group
select age_group, sum(purchase_amount) as total_revenue
from customer
group by age_group
order by total_revenue desc;

