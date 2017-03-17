--Marks all the accounts that don't have error with an 'OK' message.
UPDATE PF_PO_INBOX SET PO_SB_MESSAGE = 'OK' WHERE PO_SB_MESSAGE IS NULL;

--Log
INSERT INTO PF_LOG (LOG_DATE, LOGTIME, LOG_USER, LOG_ACTION, LOG_COMMENT) VALUES (TO_CHAR(SYSDATE, 'YYYYMMDD'), TO_CHAR(SYSDATE, 'HHMISS'), 'MAT', 'Mark OK', 'Marks all the accounts that dont have error with an OK message.')
