SELECT
  `city`,
  `email`,
  `phone`,
  `state`,
  `store_id`,
  `store_name`,
  `street`,
  `zip_code`
FROM {{source("projet_final","stores")}}