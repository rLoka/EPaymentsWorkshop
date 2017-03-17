--Reinitializes bank accounts balances
INSERT INTO PF_BANKACCOUNTS_BALANCE (ACCOUNT_ID, BANK_ID, CUSTOMER_ID, BALANCE_DATE, BALANCE_TIME, BALANCE) SELECT ACCOUNT_ID, BANK_ID, CUSTOMER_ID, INIT_DATE, INIT_TIME, AMOUNT FROM PF_BANKACCOUNTS_INIT;

--Log
INSERT INTO PF_LOG (LOG_DATE, LOGTIME, LOG_USER, LOG_ACTION, LOG_COMMENT) VALUES (TO_CHAR(SYSDATE, 'YYYYMMDD'), TO_CHAR(SYSDATE, 'HHMISS'), 'KAR', 'Balances initialized.', 'Balances have been initialized.')
