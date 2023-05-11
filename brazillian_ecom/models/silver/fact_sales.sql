SELECT
	ro.order_id
	, ro.customer_id
	, ro.order_purchase_timestamp
	, roi.product_id
	, rop.payment_value
	, ro.order_status
FROM {{ref("olist_orders")}} ro
-- JOIN {{source("brazillian_ecom", "olist_order_items")}} roi
JOIN {{ref("olist_orders_items_laptop")}} roi
ON ro.order_id = roi.order_id
JOIN {{ref("olist_order_payments")}} rop
ON ro.order_id = rop.order_id