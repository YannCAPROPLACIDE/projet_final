with w_order_items_by_products as (
select
    order_id,
    item_id,
    quantity,
    product_id,
    list_price,
    discount
from {{ref("stg_projet_final__order_items")}}  
)
select 
    w_order_items_by_products.order_id,
    w_order_items_by_products.item_id,
    w_order_items_by_products.quantity,
    w_order_items_by_products.list_price,
    w_order_items_by_products.discount,
    stg_products.product_id,
    stg_products.product_name,
    stg_products.brand_id,
    stg_products.category_id,
    stg_products.model_year,
    stg_categories.category_name,
    stg_brands.brand_name
from {{ref('stg_projet_final__products')}} as stg_products
left join w_order_items_by_products on w_order_items_by_products.product_id = stg_products.product_id
left join {{ref('stg_projet_final__categories')}} as stg_categories on stg_products.category_id = stg_categories.category_id
left join {{ref('stg_projet_final__brands')}} as stg_brands on stg_products.brand_id = stg_brands.brand_id