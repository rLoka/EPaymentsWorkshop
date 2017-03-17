--Checks whether there are bad Bank ID-s (Source or Destination) in PF_PO_INBOX, and if there are, it marks them with code ERROR in PO_SB_MESSAGE column
UPDATE PF_PO_INBOX SET PO_SB_MESSAGE = 'ERROR: Inexisting or Wrong Bank ID' WHERE SB_BANK_ID NOT IN (SELECT BANK_ID FROM PF_MEMBERBANKS) OR DB_BANK_ID NOT IN (SELECT BANK_ID FROM PF_MEMBERBANKS);

--Log
INSERT INTO PF_LOG (LOG_DATE, LOGTIME, LOG_USER, LOG_ACTION, LOG_COMMENT) VALUES (TO_CHAR(SYSDATE, 'YYYYMMDD'), TO_CHAR(SYSDATE, 'HHMISS'), 'KAR', 'Check for bad Banks.', 'Check if there are bad Banks names.')
