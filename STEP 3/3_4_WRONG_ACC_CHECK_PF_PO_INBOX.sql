--Checks whether there are bad Account ID-s (Destination only) in PF_PO_INBOX, and if there are, it marks them with code ERROR in PO_SB_MESSAGE column
UPDATE PF_PO_INBOX SET PO_SB_MESSAGE = 'ERROR: Inexisting or Wrong Account ID' WHERE DB_ACCOUNT_ID NOT IN (SELECT ACCOUNT_ID FROM PF_BANKACCOUNTS_INIT);

--Log
INSERT INTO PF_LOG (LOG_DATE, LOGTIME, LOG_USER, LOG_ACTION, LOG_COMMENT) VALUES (TO_CHAR(SYSDATE, 'YYYYMMDD'), TO_CHAR(SYSDATE, 'HHMISS'), 'KAR', 'Check for bad Accounts.', 'Check if there are non-existent account names.')
