SELECT 
gcmsbase_district_tab.region_id,
gcmsbase_region_tab.regionname ,
gcmsbase_district_tab.id as districtid,
gcmsbase_district_tab.districtname,
gcmsbase_area_tab.id as area_id,
gcmsbase_area_tab.areaname
FROM gcmsbase_area_tab
left join gcmsbase_district_tab on gcmsbase_district_tab.id =  gcmsbase_area_tab.district_id
left join gcmsbase_region_tab on gcmsbase_region_tab.id =  gcmsbase_area_tab.region_id
where ( gcmsbase_area_tab.region_id = {{ui.select_region.value || activeRoute.queryParams.regionid}} and gcmsbase_area_tab.country_id = {{ui.select.value || activeRoute.queryParams.countryid}})
