--Checks whether all transactions comply with Business Rules (BR) for the first Test run

--BR 2
UPDATE PF_PO_INBOX SET PO_SB_MESSAGE = 'ERROR: Incorrect timestamps' WHERE IN_TIME IS NULL OR IN_DATE IS NULL;

--BR 9
UPDATE PF_PO_INBOX SET PO_SB_MESSAGE = 'ERROR: Amount over Quota' WHERE PO_AMOUNT > 50000;

--Log
INSERT INTO PF_LOG (LOG_DATE, LOGTIME, LOG_USER, LOG_ACTION, LOG_COMMENT) VALUES (TO_CHAR(SYSDATE, 'YYYYMMDD'), TO_CHAR(SYSDATE, 'HHMISS'), 'MAN', 'Check with Business Rules.', 'Check if transactions comply with business rules..')
