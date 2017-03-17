--Process external external transactions

--SABA to OTHERS (Credit side)
INSERT INTO PF_BANKACCOUNTS_TRANSACTIONS (PO_ID, ACCOUNT_ID, BANK_ID, TRANSACTION_DATE, TRANSACTION_TIME, TRANSACTION_PURPOSE, TRANSACTION_AMOUNT) SELECT PO_ID, DB_ACCOUNT_ID, DB_BANK_ID, TO_CHAR(SYSDATE, 'YYYYMMDD'), TO_CHAR(SYSDATE, 'HHMISS'), PO_PURPOSE, PO_AMOUNT FROM PF_PO_INBOX WHERE (SB_BANK_ID != 'SABA' AND DB_BANK_ID = 'SABA') AND PO_ACK_DB_MESSAGE = 'OK';

--Credit internal accounts, sum and substract account balances for transaction amount
UPDATE PF_BANKACCOUNTS_BALANCE SET BALANCE = (SELECT SUM(TRANSACTION_AMOUNT) FROM PF_BANKACCOUNTS_TRANSACTIONS WHERE PF_BANKACCOUNTS_BALANCE.ACCOUNT_ID = PF_BANKACCOUNTS_TRANSACTIONS.ACCOUNT_ID);

--History
DELETE FROM PF_TRANSACTION_HISTORY;
INSERT INTO PF_TRANSACTION_HISTORY (PO_ID, ACCOUNT_ID, BANK_ID, CUSTOMER_ID, TRANSACTION_DATE, TRANSACTION_TIME, TRANSACTION_PURPOSE, TRANSACTION_AMOUNT) SELECT DISTINCT PF_BT.PO_ID, PF_BT.ACCOUNT_ID, PF_BT.BANK_ID, PF_BB.CUSTOMER_ID, PF_BT.TRANSACTION_DATE, PF_BT.TRANSACTION_TIME, PF_BT.TRANSACTION_PURPOSE, PF_BT.TRANSACTION_AMOUNT FROM PF_BANKACCOUNTS_TRANSACTIONS PF_BT INNER JOIN PF_BANKACCOUNTS_BALANCE PF_BB ON PF_BT.ACCOUNT_ID = PF_BB.ACCOUNT_ID;

--Log
INSERT INTO PF_LOG (LOG_DATE, LOGTIME, LOG_USER, LOG_ACTION, LOG_COMMENT) VALUES (TO_CHAR(SYSDATE, 'YYYYMMDD'), TO_CHAR(SYSDATE, 'HHMISS'), 'MAN', 'Process external transactions.', 'Process external transactions - OTHERS to SABA.')
