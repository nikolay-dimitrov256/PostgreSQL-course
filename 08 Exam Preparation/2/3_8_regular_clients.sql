SELECT
    cl.full_name,
    count(co.car_id) AS count_of_cars,
    sum(co.bill) AS total_sum
FROM
    clients AS cl
JOIN
    courses AS co
ON cl.id = co.client_id
WHERE substring(cl.full_name, 2, 1) = 'a'
GROUP BY cl.full_name
HAVING count(co.car_id) > 1
ORDER BY
    cl.full_name
;