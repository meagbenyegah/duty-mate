CREATE TABLE dm_designation
(
    id  NUMBER (11) NOT NULL,
    name   VARCHAR2 (100),
    amount   NUMBER (11,2),
    date_created    timestamp DEFAULT CURRENT_TIMESTAMP,
    date_modified    timestamp DEFAULT CURRENT_TIMESTAMP
);

--Primary key constraint
ALTER TABLE dm_designation
    ADD(CONSTRAINT dmd_id_pk PRIMARY KEY (id));

--Sequence for generating unique IDs
CREATE SEQUENCE dmd_sequence NOCACHE;

CREATE OR REPLACE TRIGGER dmd_on_insert
    BEFORE INSERT
    ON dmd_staff_details
    FOR EACH ROW
BEGIN
    SELECT dmd_sequence.NEXTVAL INTO :new.id FROM DUAL;
END;