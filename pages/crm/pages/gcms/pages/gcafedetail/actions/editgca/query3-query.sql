UPDATE pc_product_tab
SET subscribed = CASE baseid
    WHEN '327691' THEN {{ui.gcapcTable.editedRow.data.HON ? 1 : 0}}
    WHEN '327871' THEN {{ui.gcapcTable.editedRow.data.LOL_VN ? 1 : 0}}
    WHEN '327941' THEN {{ui.gcapcTable.editedRow.data.FO3_VN ? 1 : 0}}
    WHEN '327931' THEN {{ui.gcapcTable.editedRow.data.FO3_SG ? 1 : 0}}
    WHEN '328371' THEN {{ui.gcapcTable.editedRow.data.FO4_VN ? 1 : 0}}
    ELSE subscribed
END
WHERE machineid = {{ui.gcapcTable.editedRow.data.machineid}}
AND cafeid = {{ui.gcapcTable.editedRow.data.cafeid}}
AND baseid IN ('327691', '327871', '327941', '327931', '328371')