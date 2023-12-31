SELECT gcmsbase_region_tab.id as regionid,gcmsbase_region_tab.regionname FROM gcmsbase_region_tab
where gcmsbase_region_tab.country_id = {{ui.select.value || 84}}