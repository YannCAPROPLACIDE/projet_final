SELECT
  `product_id`,
  `quantity`,
  `store_id`
FROM {{source("projet_final","stocks")}}