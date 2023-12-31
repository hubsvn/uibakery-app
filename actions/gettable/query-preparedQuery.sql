SELECT
    cafe_cafe_tab.id,
    cafe_cafe_tab.cafe_name,
    cafe_cafe_tab.number_of_pc as Size,
    authkey,
    cafe_cafe_tab.currentstatus as status_code,
    cafe_url,
    cafe_phone,
    contact_name,
    contact_email,
    contact_phone,
    address,
    product_item_tab.name as package,
    product_cafe_product_tab.num_of_pc,
    product_cafe_product_tab.update_time,
    product_cafe_product_tab.start_date,
     product_cafe_product_tab.end_date,
    cafe_cafe_tab.district_id,
    cafe_cafe_tab.area_id,
    cafe_cafe_tab.region_id,    
    gcmsbase_district_tab.districtname,
    gcmsbase_region_tab.regionname,
    gcmsbase_area_tab.areaname
FROM cafe_cafe_tab
LEFT JOIN gcmsbase_district_tab 
    ON gcmsbase_district_tab.id = cafe_cafe_tab.district_id 
LEFT JOIN gcmsbase_area_tab 
    ON gcmsbase_area_tab.id = cafe_cafe_tab.area_id
LEFT JOIN gcmsbase_region_tab 
    ON gcmsbase_region_tab.id = cafe_cafe_tab.region_id
LEFT JOIN product_cafe_product_tab 
    ON product_cafe_product_tab.cafe_id = cafe_cafe_tab.id 
    AND product_cafe_product_tab.item_id = 4 
LEFT JOIN product_item_tab 
    ON product_item_tab.id = product_cafe_product_tab.item_id
WHERE
 (CASE 
            WHEN ? <> "" THEN CONCAT(cafe_cafe_tab.id,cafe_cafe_tab.cafe_name,authkey,contact_name,contact_email,contact_phone,address) like CONCAT('%', ?, '%')
  ELSE 1 = 1 
        END)
      AND  (CASE 
            WHEN ? != "" THEN  cafe_cafe_tab.region_id = ?
            ELSE 1 = 1 
        END)
    AND  (CASE 
            WHEN ? != "" THEN  cafe_cafe_tab.district_id = ?
            ELSE 1 = 1 
        END)
    AND (
        CASE
            WHEN ? = 'expired' THEN product_cafe_product_tab.end_date < ? 
            WHEN ? = 'not_expired' THEN product_cafe_product_tab.end_date >= ?
            WHEN ? = 'expired_to_this_month' THEN product_cafe_product_tab.end_date < ?  AND product_cafe_product_tab.end_date >= now()
            WHEN ? = 'expired_to_next_2_weeks' THEN product_cafe_product_tab.end_date >  NOW() AND product_cafe_product_tab.end_date < ?
        END
    )
    and cafe_cafe_tab.country_id = ?
ORDER by cafe_cafe_tab.id