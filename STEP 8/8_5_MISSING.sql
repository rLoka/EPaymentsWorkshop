--Process MISSING
SELECT PO_ID 
FROM PF_PO_OUTBOX 
minus
SELECT PO_ID FROM
PF_ACK_INBOX;
