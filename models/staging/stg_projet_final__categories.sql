SELECT
  `category_id`,
  `category_name`
FROM {{source("projet_final","categories")}}