SELECT
  `item_id`,
  `list_price`,
  `order_id`,
  `product_id`,
  `quantity`,
  `discount`,
  round(((quantity * list_price) * (1 - discount)), 2)  as total_order_amount
from {{source('projet_final', 'order_items')}}
  
