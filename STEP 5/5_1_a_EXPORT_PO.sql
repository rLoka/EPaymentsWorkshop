--Export PF_PO_OUTBOX TO XML with where clause:
SB_BANK_ID = 'SABA' AND DB_BANK_ID != 'SABA'

--We want to export transactions that originate from us towards other banks
--XML file has to be named: "PO_SABA_CH_RUN1.xml"
--XML file is sent to Clearing House (CH)

--Log
--INSERT INTO PF_LOG (LOG_DATE, LOGTIME, LOG_USER, LOG_ACTION, LOG_COMMENT) VALUES (TO_CHAR(SYSDATE, 'YYYYMMDD'), TO_CHAR(SYSDATE, 'HHMISS'), 'MAT', 'Process internal transactions.', 'Process internal transactions - SABA to SABA, OTHERS to SABA.')
