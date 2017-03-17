--Reinitializes bank accounts balances
DELETE FROM PF_BANKACCOUNTS_TRANSACTIONS WHERE TRANSACTION_PURPOSE != 'Initialization';

--Log
INSERT INTO PF_LOG (LOG_DATE, LOGTIME, LOG_USER, LOG_ACTION, LOG_COMMENT) VALUES (TO_CHAR(SYSDATE, 'YYYYMMDD'), TO_CHAR(SYSDATE, 'HHMISS'), 'MAT', 'Delete transactions.', 'Delete old transactions.')
