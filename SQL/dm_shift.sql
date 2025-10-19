CREATE TABLE dm_shift
(
    id  NUMBER (11) NOT NULL,
    name   VARCHAR2(100),
    time_of_day   VARCHAR2(100),
    shift_date   DATE,
    date_created    timestamp DEFAULT CURRENT_TIMESTAMP,
    date_modified    timestamp DEFAULT CURRENT_TIMESTAMP
);

--Primary key constraint
ALTER TABLE dm_shift
    ADD(CONSTRAINT dmsh_id_pk PRIMARY KEY (id));

--Sequence for generating unique IDs
CREATE SEQUENCE dmsh_sequence NOCACHE;

CREATE OR REPLACE TRIGGER dmsh_on_insert
    BEFORE INSERT
    ON dm_shift
    FOR EACH ROW
BEGIN
    SELECT dmsh_sequence.NEXTVAL INTO :new.id FROM DUAL;
END;