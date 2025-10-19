CREATE TABLE dm_holiday
(
    id  NUMBER (11) NOT NULL,
    name   VARCHAR2 (100),
    holiday_date   DATE,
    adjusted_date   DATE,
    date_created    timestamp DEFAULT CURRENT_TIMESTAMP,
    date_modified    timestamp DEFAULT CURRENT_TIMESTAMP,
    status          VARCHAR (255) NOT NULL DEFAULT 'ACTIVE'
);

--Primary key constraint
ALTER TABLE dm_holiday
    ADD(CONSTRAINT dmh_id_pk PRIMARY KEY (id));

--Sequence for generating unique IDs
CREATE SEQUENCE dmh_sequence NOCACHE;

CREATE OR REPLACE TRIGGER dmh_on_insert
    BEFORE INSERT
    ON dm_holiday
    FOR EACH ROW
BEGIN
    SELECT dmh_sequence.NEXTVAL INTO :new.id FROM DUAL;
END;