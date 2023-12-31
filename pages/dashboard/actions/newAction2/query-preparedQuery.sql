SELECT
    cafe_cafe_tab.id,
    cafe_cafe_tab.cafe_name,
    cafe_cafe_tab.number_of_pc AS "Reg Size",
    cafe_cafe_tab.currentstatus AS status_code,
    IF(cafe_cafe_tab.currentstatus = 3, "Hoạt động",
        IF(cafe_cafe_tab.currentstatus = 1, "Mới đăng ký", "Khóa")) AS currentstatus,
    cafe_cafe_tab.cafe_url,
    cafe_cafe_tab.cafe_phone,
    cafe_cafe_tab.contact_name,
    cafe_cafe_tab.contact_email,
    cafe_cafe_tab.contact_phone,
    cafe_cafe_tab.contact_mobile,
    cafe_cafe_tab.address,
    gcmsbase_district_tab.districtname,
CONCAT(
    '[',
    GROUP_CONCAT(
        CONCAT(
            '{ "pkg_name": "', product_item_tab.name, '"',
            ', "pkg_size": "', product_cafe_product_tab.num_of_pc, '"',
            ', "end_date": "', product_cafe_product_tab.end_date, '"'
            '}'
        )
        SEPARATOR ','
    ),
    ']'
) AS license,
    cafe_cafe_tab.district_id,
    cafe_cafe_tab.area_id,
    gcmsbase_area_tab.areaname
FROM cafe_cafe_tab
LEFT JOIN gcmsbase_district_tab ON gcmsbase_district_tab.id = cafe_cafe_tab.district_id
LEFT JOIN gcmsbase_area_tab ON gcmsbase_area_tab.id = cafe_cafe_tab.area_id
LEFT JOIN gcmsbase_region_tab ON gcmsbase_region_tab.id = cafe_cafe_tab.region_id
LEFT JOIN product_cafe_product_tab ON product_cafe_product_tab.cafe_id = cafe_cafe_tab.id
LEFT JOIN product_item_tab ON product_item_tab.id = product_cafe_product_tab.item_id
WHERE cafe_cafe_tab.contact_phone = "0974489489"
    AND cafe_cafe_tab.currentstatus IN (1, 3)
GROUP BY cafe_cafe_tab.id
ORDER BY product_cafe_product_tab.end_date DESC
LIMIT 3;
