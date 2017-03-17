--Quality and Business rules checkings of external accounts
UPDATE PF_PO_INBOX SET PO_ACK_DB_MESSAGE = 'ERROR: Inexisting or Wrong Bank ID' WHERE SB_BANK_ID NOT IN (SELECT BANK_ID FROM PF_MEMBERBANKS) OR DB_BANK_ID NOT IN (SELECT BANK_ID FROM PF_MEMBERBANKS);
UPDATE PF_PO_INBOX SET PO_ACK_DB_MESSAGE = 'ERROR: Inexisting or Wrong Account ID' WHERE DB_ACCOUNT_ID NOT IN (SELECT ACCOUNT_ID FROM PF_BANKACCOUNTS_INIT);
UPDATE PF_PO_INBOX SET PO_ACK_DB_MESSAGE = 'ERROR: Incorrect timestamps' WHERE IN_TIME IS NULL OR IN_DATE IS NULL;
UPDATE PF_PO_INBOX SET PO_ACK_DB_MESSAGE = 'ERROR: Amount over Quota' WHERE PO_AMOUNT > 50000;
UPDATE PF_PO_INBOX SET PO_ACK_DB_MESSAGE = 'OK' WHERE PO_ACK_DB_MESSAGE IS NULL;

--Log
INSERT INTO PF_LOG (LOG_DATE, LOGTIME, LOG_USER, LOG_ACTION, LOG_COMMENT) VALUES (TO_CHAR(SYSDATE, 'YYYYMMDD'), TO_CHAR(SYSDATE, 'HHMISS'), 'MAR', 'Quality and Business rules checkings.', 'Quality and Business rules checkings of external accounts.');