SELECT 
    store_transaction_tab.id,
    store_transaction_tab.number_of_pc,
    store_transaction_tab.start_date,
    store_transaction_tab.end_date,
    purchase_type,
    IF(purchase_type =1,"Topup",IF(purchase_type =2,"+- Size","Refund")) as Type ,
    product_package_tab.name,
    product_package_tab.product_type,
    purchase_time,
    auth_user.email,
    store_transaction_tab.current_status,
    IF(store_transaction_tab.current_status =1,"Success","Faild") as Tx_status, 
    store_transaction_tab.description as Hub_email
FROM 
    store_transaction_tab 
LEFT JOIN 
    product_package_tab on product_package_tab.id = store_transaction_tab.package_id
LEFT JOIN 
    auth_user on auth_user.id = payee_id
where 
    cafe_id = {{activeRoute.queryParams.cafeid}}
ORDER BY 
    purchase_time desc
