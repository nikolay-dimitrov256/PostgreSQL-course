CREATE OR REPLACE FUNCTION fn_get_volunteers_count_from_department(searched_volunteers_department VARCHAR(30))
RETURNS INT
AS
$$
    DECLARE 
        result INT;
    BEGIN
        SELECT
            count(*) INTO result
        FROM
            volunteers as v
        JOIN
            volunteers_departments AS vd
        ON v.department_id = vd.id
        WHERE
            department_name = searched_volunteers_department
        ;
        
        RETURN result;
    END;
$$
LANGUAGE plpgsql;

