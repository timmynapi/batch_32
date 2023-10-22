-- select *
-- from batch2

with first_table as
(select o1.order_id, o1.shipping_limit_date, price, freight_value,
		o2.customer_id,order_status, order_purchase_timestamp,
		p.product_category_name
from order_items_data as o1
left join orders_data as o2
on o1.order_id = o2.order_id 
left join product_data as p 
on o1.product_id = p.product_id),
second_table as
(select f.*, c.customer_city, c.customer_state
from first_table as f
left join customer_data as c
on f.customer_id = c.customer_id)