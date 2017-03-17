--Quality and Business rules checkings of external accounts
UPDATE PF_PO_INBOX SET PO_DB_DATE = TO_CHAR(SYSDATE, 'YYYYMMDD') WHERE PO_DB_DATE IS NULL;
UPDATE PF_PO_INBOX SET PO_DB_TIME = TO_CHAR(SYSDATE, 'HHMISS') WHERE PO_DB_TIME IS NULL;

--Log
INSERT INTO PF_LOG (LOG_DATE, LOGTIME, LOG_USER, LOG_ACTION, LOG_COMMENT) VALUES (TO_CHAR(SYSDATE, 'YYYYMMDD'), TO_CHAR(SYSDATE, 'HHMISS'), 'KAR', 'External timestamp', 'Update all records that dont have timing marks with date and time stamps.')
