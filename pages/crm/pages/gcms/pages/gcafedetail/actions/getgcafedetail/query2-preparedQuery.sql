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
    CONCAT(
        '[',
        GROUP_CONCAT(
            CONCAT(
                '{',
                '\\"Pkg Name\\":\\"', product_item_tab.name, '\\",',
               '\\"PkgID\\":\\"', product_item_tab.product_type, '\\",',
                '\\"Exp\\":\\"', product_cafe_product_tab.end_date, '\\",',
                '\\"Purchase date\\":\\"', product_cafe_product_tab.update_time, '\\",',
                '\\"Start Date\\":\\"', product_cafe_product_tab.start_date, '\\"',
                '}'
            )
            SEPARATOR ','
        ),
        ']'
    ) AS package_info,
    cafe_cafe_tab.country_id,
    cafe_cafe_tab.district_id,
    cafe_cafe_tab.area_id,
    cafe_cafe_tab.region_id,    
    gcmsbase_district_tab.districtname,
    gcmsbase_region_tab.regionname,
    gcmsbase_area_tab.areaname,
    gcmsbase_country_tab.countryname
FROM cafe_cafe_tab
LEFT JOIN gcmsbase_country_tab 
    ON gcmsbase_country_tab.id = cafe_cafe_tab.country_id 
LEFT JOIN gcmsbase_district_tab 
    ON gcmsbase_district_tab.id = cafe_cafe_tab.district_id 
LEFT JOIN gcmsbase_area_tab 
    ON gcmsbase_area_tab.id = cafe_cafe_tab.area_id
LEFT JOIN gcmsbase_region_tab 
    ON gcmsbase_region_tab.id = cafe_cafe_tab.region_id
LEFT JOIN product_cafe_product_tab 
    ON product_cafe_product_tab.cafe_id = cafe_cafe_tab.id 
LEFT JOIN product_item_tab 
    ON product_item_tab.id = product_cafe_product_tab.item_id
WHERE 
cafe_cafe_tab.id = ?
GROUP BY cafe_cafe_tab.id
ORDER by cafe_cafe_tab.id
