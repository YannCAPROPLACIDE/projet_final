SELECT
  `brand_id`,
  `brand_name`
FROM {{source("projet_final","brands")}}
