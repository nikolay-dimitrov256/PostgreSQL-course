CREATE OR REPLACE PROCEDURE sp_increase_salary_by_id(id INT)
AS
$$
DECLARE
    old_salary INT;
    new_salary INT;
BEGIN
    SELECT
        salary INTO old_salary
    FROM employees
    WHERE employee_id = id;

    UPDATE employees
    SET salary = salary * 1.05
    WHERE employee_id = id;

    SELECT
        salary
    FROM employees
    WHERE employee_id = id INTO new_salary;

    IF
        old_salary * 1.05 <> new_salary THEN 
        ROLLBACK;
        RETURN;
    END IF;

    COMMIT;
END;
$$
LANGUAGE plpgsql;