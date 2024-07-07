SELECT
    name,
    phone_number,
    ltrim(address, 'Sofia , ') AS address
FROM
    volunteers
WHERE
    address LIKE '%Sofia%'
    AND
    department_id = (SELECT id FROM volunteers_departments WHERE department_name = 'Education program assistant')
ORDER BY
    name
;