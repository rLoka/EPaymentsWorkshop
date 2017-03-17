--This is just an example log script, every SQL file has the LOG insertion COMMAND.
--Do not execute this, as this is DUMMY data.
--Always change 'ANON' to your Initials as follows: Matea - 'MAT', Manon - 'MAN', Marit - 'MAR', Karlo - 'KAR'
--Change description to suit the action.
INSERT INTO PF_LOG (LOG_DATE, LOGTIME, LOG_USER, LOG_ACTION, LOG_COMMENT) VALUES (TO_CHAR(SYSDATE, 'YYYYMMDD'), TO_CHAR(SYSDATE, 'HHMISS'), 'ANON', 'Title of action.', 'Description of action.');
