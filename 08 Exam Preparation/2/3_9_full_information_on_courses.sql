SELECT
    ad.name AS address,
    CASE
        WHEN extract('hour' FROM co.start) BETWEEN 6 AND 20 THEN 'Day'
        ELSE 'Night'
    END AS day_time,
    co.bill,
    cl.full_name,
    ca.make,
    ca.model,
    cat.name
FROM
    courses AS co
JOIN
    addresses AS ad
ON co.from_address_id = ad.id
JOIN
    clients AS cl
ON co.client_id = cl.id
JOIN
    cars AS ca
ON co.car_id = ca.id
JOIN
    categories AS cat
ON ca.category_id = cat.id
ORDER BY
    co.id
;
