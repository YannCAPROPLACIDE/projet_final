select 
  extract(year from orders.order_date) as year,
  orders.store_name as store_name,
  orders.city as city,
  products.brand_name as brand_name,
  products.category_name as category_name,
  products.product_name as product_name,
  sum(products.quantity) as total_quantity_products_sold
from {{ref('int_projet_final__orders')}} as orders
left join {{ref('int_projet_final__products')}} as products on products.order_id = orders.order_id
group by year, store_name, city, brand_name, category_name, product_name
order by year desc