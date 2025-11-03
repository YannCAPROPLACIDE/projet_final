select 
  extract(year from order_date) as year,
  store_name,
  city,
  count(distinct order_id) as total_orders,
  round(AVG(total_distinct_items), 2) as average_total_disctinct_items,
  round(AVG(total_order_amount_by_order_id), 2) as average_total_order_amount
from {{ref('int_projet_final__orders')}}
group by year, store_name, city
order by year desc, total_orders desc
