--Delets test data from TESTDATA tables
DELETE FROM PF_PO_TESTDATA;
DELETE FROM PF_PO_TESTDATA_RUN0;
DELETE FROM PF_PO_TESTDATA_RUN1;
DELETE FROM PF_PO_TESTDATA_RUN2;
DELETE FROM PF_PO_TESTDATA_RUN3;

--Log
INSERT INTO PF_LOG (LOG_DATE, LOGTIME, LOG_USER, LOG_ACTION, LOG_COMMENT) VALUES (TO_CHAR(SYSDATE, 'YYYYMMDD'), TO_CHAR(SYSDATE, 'HHMISS'), 'MAR', 'Delete test data.', 'Test data has been removed!')