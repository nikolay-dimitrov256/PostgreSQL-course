CREATE OR REPLACE FUNCTION fn_full_name(first_name VARCHAR(20), last_name VARCHAR(20))
RETURNS VARCHAR(41)
AS
$$
    BEGIN
        RETURN concat(initcap(first_name), ' ', initcap(last_name));
    END;
$$
LANGUAGE plpgsql;