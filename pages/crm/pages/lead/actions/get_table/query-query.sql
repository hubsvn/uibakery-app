SELECT *
FROM 
garena_member
JOIN garena_garena_account ON garena_garena_account.phone_number = garena_member.phone_number
WHERE
    (CASE 
        WHEN '{{ui.city.value}}' != '' THEN garena_member.city = '{{ui.city.value}}'
        ELSE 1=1
    END) 
    AND
    (CASE 
        WHEN '{{ui.game.value}}' != '' THEN garena_member.game = '{{ui.game.value}}'
        ELSE 1=1
     END) 
LIMIT {{ui.getTableTable.pageSize}} OFFSET {{ui.getTableTable.paginationOffset}};
