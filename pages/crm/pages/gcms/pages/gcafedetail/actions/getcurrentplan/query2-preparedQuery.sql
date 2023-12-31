SELECT 
    product_item_tab.name as package,
    product_cafe_product_tab.num_of_pc,
    product_cafe_product_tab.end_date,
    product_cafe_product_tab.update_time,
    product_cafe_product_tab.start_date,
    product_item_tab.product_type
FROM product_cafe_product_tab
LEFT JOIN product_item_tab ON product_item_tab.id = product_cafe_product_tab.item_id
WHERE cafe_id =  ?