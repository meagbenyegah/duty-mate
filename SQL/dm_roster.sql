CREATE TABLE dm_roster
(
    id  NUMBER (11) NOT NULL,
    dm_staff_id  NUMBER,
    dm_shift_id   NUMBER,
    dm_supervisor_id   NUMBER,
    date_created    timestamp DEFAULT CURRENT_TIMESTAMP,
    date_modified    timestamp DEFAULT CURRENT_TIMESTAMP
);

--Primary key constraint
ALTER TABLE dm_roster
    ADD(CONSTRAINT dmr_id_pk PRIMARY KEY (id));

--Sequence for generating unique IDs
CREATE SEQUENCE dmr_sequence NOCACHE;

CREATE OR REPLACE TRIGGER dmr_on_insert
    BEFORE INSERT
    ON dm_roster
    FOR EACH ROW
BEGIN
    SELECT dmr_sequence.NEXTVAL INTO :new.id FROM DUAL;
END;