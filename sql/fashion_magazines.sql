WITH unpaid_customers AS (
  SELECT o.customer_id, o.subscription_id, 
  o.order_status, c.customer_name
FROM orders o
JOIN customers c
  ON c.customer_id 
  = o.customer_id
WHERE order_status = 'unpaid'
)
SELECT PRINTF("$%.2f",sum(s.price_per_month*s.subscription_length)) as 'Amount Due',
uc.customer_name as 'Customer'
FROM subscriptions s
JOIN unpaid_customers uc
  ON uc.subscription_id
  = s.subscription_id
WHERE s.description = 'Fashion Magazine'
GROUP BY customer