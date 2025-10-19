CREATE TABLE dm_staff_detail
(
    id            NUMBER (11) NOT NULL,
    first_name   VARCHAR2 (100),
    last_name   VARCHAR2 (100),
    grade        VARCHAR2 (100),
    account_number        VARCHAR2 (100),
    phone_number        VARCHAR2 (100),
    date_created    timestamp DEFAULT CURRENT_TIMESTAMP,
    date_modified    timestamp DEFAULT CURRENT_TIMESTAMP,
    status          VARCHAR (255) NOT NULL DEFAULT 'ACTIVE',
    dm_designation_id    NUMBER
);

--Primary key constraint
ALTER TABLE dm_staff_detail
    ADD(CONSTRAINT dsd_id_pk PRIMARY KEY (id));

-- Foreign key constraint
ALTER TABLE dm_staff_detail
  ADD CONSTRAINT dmsd_di_fk FOREIGN KEY (designation_id) REFERENCES dm_designation (id);

--Sequence for generating unique IDs
CREATE SEQUENCE dsd_sequence NOCACHE;

CREATE OR REPLACE TRIGGER dsd_on_insert
    BEFORE INSERT
    ON dm_staff_detail
    FOR EACH ROW
BEGIN
    SELECT dsd_sequence.NEXTVAL INTO :new.id FROM DUAL;
END;