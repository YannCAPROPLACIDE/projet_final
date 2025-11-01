select
    order_id,
    sum(total_order_amount) as total_amount
from {{ref("stg_projet_final__order_items")}}
group by order_id
having total_amount < 0