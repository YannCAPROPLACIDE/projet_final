select 
  extract(year from order_date) as year,
  store_name,
  city,
  products.brand_name as brand_name,
  products.category_name as category_name,
  sum(total_distinct_items) as nb_total_distinct_product_sold,


from {{ref('int_projet_final__orders')}} as orders
left join {{ref('int_projet_final__products')}} as products on products.order_id = orders.order_id
group by year, store_name, city, brand_name, category_name
order by year desc