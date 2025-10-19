CREATE TABLE dm_staff_details
(
    id            NUMBER (11) NOT NULL,
    first_name   VARCHAR2 (100),
    last_name   VARCHAR2 (100),
    grade        VARCHAR2 (100),
    account_number        VARCHAR2 (100),
    phone_number        VARCHAR2 (100),
    date_created    timestamp DEFAULT CURRENT_TIMESTAMP,
    date_created    timestamp DEFAULT CURRENT_TIMESTAMP,
    status          VARCHAR (255) NOT NULL
);

ALTER TABLE dm_staff_details
    ADD(CONSTRAINT dsd_id_pk PRIMARY KEY (id));

CREATE SEQUENCE dsd_sequence NOCACHE;

CREATE OR REPLACE TRIGGER dsd_on_insert
    BEFORE INSERT
    ON dm_staff_details
    FOR EACH ROW
BEGIN
    SELECT dsd_sequence.NEXTVAL INTO :new.id FROM DUAL;
END;