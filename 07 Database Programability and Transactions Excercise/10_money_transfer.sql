CREATE OR REPLACE PROCEDURE sp_transfer_money(
	sender_id INT,
	receiver_id INT,
	amount NUMERIC(10, 4)
)
AS
$$
DECLARE
	account_balance NUMERIC;
	new_balance NUMERIC;
BEGIN
	account_balance := (SELECT balance FROM accounts WHERE id = sender_id);
	CALL sp_withdraw_money(sender_id, amount);
	new_balance := (SELECT balance FROM accounts WHERE id = sender_id);

	IF account_balance - amount <> new_balance THEN
		ROLLBACK;
		RETURN;
	END IF;

	account_balance := (SELECT balance FROM accounts WHERE id = receiver_id);
	CALL sp_deposit_money(receiver_id, amount);
	new_balance := (SELECT balance FROM accounts WHERE id = receiver_id);

	IF account_balance + amount <> new_balance THEN
		ROLLBACK;
		RETURN;
	END IF;
END;
$$
LANGUAGE plpgsql;

CALL sp_transfer_money(2, 1, 1000);
SELECT * from accounts WHERE id IN (1, 2);
