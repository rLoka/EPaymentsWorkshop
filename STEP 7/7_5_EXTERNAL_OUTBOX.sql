--Process external transactions (ACKS)

--OTHERS to SABA that have been processed successfully
INSERT INTO PF_ACK_OUTBOX SELECT * FROM PF_PO_INBOX WHERE DB_BANK_ID = 'SABA' AND SB_BANK_ID != 'SABA' AND PO_ACK_DB_MESSAGE IS NOT NULL;

--Log
INSERT INTO PF_LOG (LOG_DATE, LOGTIME, LOG_USER, LOG_ACTION, LOG_COMMENT) VALUES (TO_CHAR(SYSDATE, 'YYYYMMDD'), TO_CHAR(SYSDATE, 'HHMISS'), 'KAR', 'Process ACKS.', 'Process ACKS OTHERS to SABA.')
