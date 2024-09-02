CREATE OR REPLACE PROCEDURE sp_withdraw_money(
	account_id INT,
	money_amount NUMERIC(10, 4)
)
AS
$$
DECLARE
	account_balance NUMERIC;
BEGIN
	SELECT
		balance INTO account_balance
	FROM
		accounts
	WHERE
		id = account_id;

	IF account_balance < money_amount THEN
		RAISE NOTICE 'Insufficient balance to withdraw %', money_amount;
		RETURN;
	END IF;

	UPDATE 
		accounts
	SET
		balance = balance - money_amount
	WHERE
		id = account_id;
END;
$$
LANGUAGE plpgsql;

CALL sp_withdraw_money(1, 100);

SELECT * FROM accounts WHERE id = 1;