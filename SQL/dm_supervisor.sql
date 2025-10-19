CREATE TABLE dm_supervisor
(
    id  NUMBER (11) NOT NULL,
    first_name   VARCHAR2 (100),
    last_name   VARCHAR2 (100),
    phone_number        VARCHAR2 (100),
    date_created    timestamp DEFAULT CURRENT_TIMESTAMP,
    date_modified    timestamp DEFAULT CURRENT_TIMESTAMP
);

--Primary key constraint
ALTER TABLE dm_supervisor
    ADD(CONSTRAINT dms_id_pk PRIMARY KEY (id));

--Sequence for generating unique IDs
CREATE SEQUENCE dms_sequence NOCACHE;

CREATE OR REPLACE TRIGGER dms_on_insert
    BEFORE INSERT
    ON dms_staff_details
    FOR EACH ROW
BEGIN
    SELECT dms_sequence.NEXTVAL INTO :new.id FROM DUAL;
END;