SELECT
  `active`,
  `email`,
  `first_name`,
  `last_name`,
  `manager_id`,
  `phone`,
  `staff_id`,
  `store_id`,
  concat(concat(first_name, " "), last_name) as employee
FROM {{source("projet_final","staffs")}}