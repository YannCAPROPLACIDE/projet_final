select 
  extract(year from orders.order_date) as year,
  orders.store_name as store_name,
  orders.city as city,
  count(distinct orders.order_id) as quantity_orders,
  round(AVG(orders.total_distinct_items), 2) as average_total_distinct_items,
  round(AVG(orders.total_order_amount_by_order_id), 2) as average_total_order_amount
from {{ref('int_projet_final__orders')}} as orders
group by year, store_name, city
order by year desc, quantity_orders desc
