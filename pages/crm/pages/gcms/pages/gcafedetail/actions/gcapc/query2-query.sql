SELECT cafe_pc_tab.id,cafe_pc_tab.cafeid,cafe_pc_tab.machineid,pcname,volsn,sid,wanip,cafe_pc_tab.version,pc_product_tab.baseid,cafe_pc_tab.valid ,subscribed,
from_unixtime(cafe_pc_tab.firstaccess) as firstaccess,from_unixtime(cafe_pc_tab.lastaccess)  
as lastaccessvalid, valid as "status",
 max(case when baseid = '327691' then subscribed end)  "HON",
  max(case when baseid = '327871' then subscribed end)  "LOL_VN",
  max(case when baseid = '327941' then subscribed end) "FO3_VN",
  max(case when baseid = '327931' then subscribed end)  "FO3_SG",
  max(case when baseid = '328371' then subscribed end) "FO4_VN"
FROM cafe_pc_tab
JOIN pc_product_tab
on pc_product_tab.machineid = cafe_pc_tab.machineid and pc_product_tab.cafeid = cafe_pc_tab.cafeid
JOIN product_item_tab on product_item_tab.product_type = pc_product_tab.baseid
where cafe_pc_tab.cafeid =  {{activeRoute.queryParams.cafeid}}  
GROUP BY cafe_pc_tab.cafeid,cafe_pc_tab.machineid