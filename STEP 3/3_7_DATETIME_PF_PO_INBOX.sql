--Update all records that don't have timing marks with date and time stamps
UPDATE PF_PO_INBOX SET PO_SB_DATE = TO_CHAR(SYSDATE, 'YYYYMMDD') WHERE PO_SB_DATE IS NULL;
UPDATE PF_PO_INBOX SET PO_SB_TIME = TO_CHAR(SYSDATE, 'HHMISS') WHERE PO_SB_TIME IS NULL;

--Log
INSERT INTO PF_LOG (LOG_DATE, LOGTIME, LOG_USER, LOG_ACTION, LOG_COMMENT) VALUES (TO_CHAR(SYSDATE, 'YYYYMMDD'), TO_CHAR(SYSDATE, 'HHMISS'), 'MAR', 'Inbox timestamp', 'Update all records that dont have timing marks with date and time stamps.')
