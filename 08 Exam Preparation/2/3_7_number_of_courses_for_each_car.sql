SELECT
    ca.id AS car_id,
    ca.make,
    ca.mileage,
    count(co.id) AS count_of_courses,
    round(avg(co.bill), 2) AS average_bill
FROM
    cars AS ca
LEFT JOIN
    courses AS co
ON ca.id = co.car_id
GROUP BY
    ca.id
HAVING count(co.id) <> 2
ORDER BY count_of_courses DESC, ca.id
;