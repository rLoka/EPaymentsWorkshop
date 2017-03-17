--This scripts Initializes bank accounts to Amount specified by CH/COACH and sets Initialization dates
UPDATE PF_BANKACCOUNTS_INIT SET AMOUNT = 50000, INIT_DATE = TO_CHAR(SYSDATE, 'YYYYMMDD'), INIT_TIME = TO_CHAR(SYSDATE, 'HHMISS');

--Log
INSERT INTO PF_LOG (LOG_DATE, LOGTIME, LOG_USER, LOG_ACTION, LOG_COMMENT) VALUES (TO_CHAR(SYSDATE, 'YYYYMMDD'), TO_CHAR(SYSDATE, 'HHMISS'), 'MAT', 'Account initialization.', 'Accounts have been initialized!')
