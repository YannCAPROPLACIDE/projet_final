with w_order_items_grouped_by_order as (

select 
  order_id,
  round(SUM(total_order_amount), 2) as total_order_amount_by_order_id,
  SUM(quantity) as total_items,
  count(distinct product_id) as total_distinct_items


from {{ref("stg_projet_final__order_items")}}
group by order_id

)
select 
    stg_orders.order_id,
    stg_orders.customer_id,
    stg_orders.store_id,
    stg_orders.staff_id,
    stg_orders.order_date,
    stg_orders.required_date,
    stg_orders.shipped_date,
    w_oi_b_order.total_order_amount_by_order_id,
    w_oi_b_order.total_items,
    w_oi_b_order.total_distinct_items,
    stg_stores.store_name,
    stg_stores.city,
    stg_stores.state,
    stg_staffs.employee
from {{ref("stg_projet_final__orders")}} as stg_orders
left join w_order_items_grouped_by_order as w_oi_b_order on stg_orders.order_id = w_oi_b_order.order_id
left join {{ref("stg_projet_final__stores")}} as stg_stores on stg_orders.store_id = stg_stores.store_id
left join {{ref("stg_projet_final__staffs")}} as stg_staffs on stg_orders.staff_id = stg_staffs.staff_id