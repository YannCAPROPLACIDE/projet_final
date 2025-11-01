SELECT
  `item_id`,
  `list_price`,
  `order_id`,
  `product_id`,
  `quantity`,
  `discount`,
  round(1*(quantity * list_price + discount), 2) as total_order_amount
from {{source('projet_final', 'order_items')}}
  
