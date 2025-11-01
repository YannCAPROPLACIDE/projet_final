select 
  extract(year from order_date) as year,
  orders.store_name as store_name,
  sum(total_items) as nb_total_items

from {{ref('int_projet_final__orders')}} as orders
left join {{ref('int_projet_final__products')}} as products on products.order_id = orders.order_id
group by year, store_name