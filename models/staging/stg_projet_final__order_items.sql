SELECT
  `discount`,
  `item_id`,
  `list_price`,
  `order_id`,
  `product_id`,
  `quantity`,
  quantity * list_price as shipping_cost
from {{source('projet_final', 'order_items')}}
  
