CREATE OR REPLACE FUNCTION fn_courses_by_client(phone_num VARCHAR(20))
RETURNS INT
AS
$$
    DECLARE
        result INT;
    BEGIN
        SELECT
            count(*) INTO result
        FROM
            clients AS cl
        JOIN
            courses AS co
        ON cl.id = co.client_id
        WHERE
            cl.phone_number = phone_num
        GROUP BY cl.phone_number;

        IF result IS NULL THEN result := 0;
        END IF;
        
        RETURN result;
    END;
$$
LANGUAGE plpgsql;