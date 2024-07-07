CREATE OR REPLACE PROCEDURE udp_modify_account(IN address_street VARCHAR(30), IN address_town VARCHAR(30))
AS
$$
    DECLARE
        account INT;
    BEGIN
        SELECT
            account_id INTO account
        FROM
            addresses
        WHERE
            street = address_street
            AND
            town = address_town;

        IF account IS NULL THEN
            RETURN;
        END IF;

        UPDATE accounts
        SET job_title = concat('(Remote) ', job_title)
        WHERE id = account;
    END;
$$
LANGUAGE plpgsql;
