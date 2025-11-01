select 
  extract(year from order_date) as year,
  products.product_name as product_name,
  products.brand_name as brand_name,
  orders.store_name as store_name,
  sum(total_distinct_items) as nb_total_distinct_items

from {{ref('int_projet_final__orders')}} as orders
left join {{ref('int_projet_final__products')}} as products on products.order_id = orders.order_id
group by year, product_name, brand_name, store_name