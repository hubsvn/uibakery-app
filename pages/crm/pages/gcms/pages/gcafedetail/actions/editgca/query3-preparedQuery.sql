UPDATE pc_product_tab
SET subscribed = CASE baseid
    WHEN '327691' THEN ?
    WHEN '327871' THEN ?
    WHEN '327941' THEN ?
    WHEN '327931' THEN ?
    WHEN '328371' THEN ?
    ELSE subscribed
END
WHERE machineid = ?
AND cafeid = ?
AND baseid IN ('327691', '327871', '327941', '327931', '328371')