select 
  extract(year from orders.order_date) as year,
  orders.store_name as store_name,
  orders.employee as employee,
  products.category_name as category_name,
  products.brand_name as brand_name,
  sum(round(((quantity * list_price) * (1 - discount)), 2)) as total_order_amount
from {{ref('int_projet_final__orders')}} as orders
left join {{ref('int_projet_final__products')}} as products on orders.order_id = products.order_id
group by year, store_name, employee, category_name, brand_name
order by year desc