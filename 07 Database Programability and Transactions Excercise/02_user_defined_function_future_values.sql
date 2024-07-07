CREATE OR REPLACE FUNCTION fn_calculate_future_value(initial_sum DECIMAL, yearly_interest_rate DECIMAL, number_of_years INT)
RETURNS DECIMAL
AS
$$
    DECLARE
        result DECIMAL;
        interest DECIMAL;
    BEGIN
        result := initial_sum;
        FOR year IN 1 .. number_of_years LOOP
            interest := result * yearly_interest_rate;
            result := result + interest;
        END LOOP;
        RETURN trunc(result, 4);
    END;
$$
LANGUAGE plpgsql;

SELECT fn_calculate_future_value (1000, 0.1, 5);
SELECT fn_calculate_future_value(2500, 0.30, 2);
SELECT fn_calculate_future_value(500, 0.25, 10);