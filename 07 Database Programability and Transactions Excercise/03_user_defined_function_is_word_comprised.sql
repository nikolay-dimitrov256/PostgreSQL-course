CREATE OR REPLACE FUNCTION fn_is_word_comprised(set_of_letters VARCHAR(50), word VARCHAR(50))
RETURNS BOOLEAN
AS
$$
    BEGIN
        RETURN trim(lower(word), lower(set_of_letters)) = '';
    END;
$$
LANGUAGE plpgsql;

SELECT fn_is_word_comprised('ois tmiah%f', 'halves');
SELECT fn_is_word_comprised('ois tmiah%f', 'Sofia');
SELECT fn_is_word_comprised('bobr', 'Rob');
SELECT fn_is_word_comprised('bobr', 'kurwa');