SELECT *
FROM 
garena_member
JOIN garena_garena_account ON garena_garena_account.phone_number = garena_member.phone_number
WHERE
    (CASE 
        WHEN '?' != '' THEN garena_member.city = '?'
        ELSE 1=1
    END) 
    AND
    (CASE 
        WHEN '?' != '' THEN garena_member.game = '?'
        ELSE 1=1
     END) 
LIMIT ? OFFSET ?;
