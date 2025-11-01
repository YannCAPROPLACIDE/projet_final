select 
  extract(year from order_date) as year,
  store_name,
  count(distinct order_id) as total_order

from {{ref('int_projet_final__orders')}}
group by year, store_name
order by year desc, total_order desc
