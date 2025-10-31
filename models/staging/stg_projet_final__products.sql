SELECT
  `brand_id`,
  `category_id`,
  `list_price`,
  `model_year`,
  `product_id`,
  `product_name`
FROM {{source("projet_final","products")}}