CREATE SCHEMA contacts_funcs;


CREATE TABLE contacts_funcs.contacts(
    contact_id bigint GENERATED ALWAYS AS IDENTITY,
    contact_name varchar(30),
    contact_number varchar(30),
    contact_surname varchar(30)
);

CREATE PROCEDURE contacts_funcs.add_contact(
    u_name varchar, 
    u_number varchar DEFAULT null,
    u_surname varchar DEFAULT null
    )
LANGUAGE plpgsql
AS $$ 
BEGIN
    INSERT INTO contacts_funcs.contacts(contact_name, contact_surname, contact_number) 
    VALUES (u_name, u_surname, u_number);
END; $$;

CREATE PROCEDURE contacts_funcs.delete_contact(
    u_number varchar DEFAULT null,
    u_name varchar DEFAULT null,
    u_surname varchar DEFAULT null
    )
LANGUAGE plpgsql
AS $$ 
BEGIN
IF (u_number IS NOT null and u_name IS NOT NULL) THEN 
    DELETE FROM contacts_funcs.contacts
    WHERE contact_number = u_number and contact_name = u_name;
ELSEIF u_name IS NOT null and u_surname IS NOT NULL THEN 
    DELETE FROM contacts_funcs.contacts
    WHERE contact_surname = u_surname and contact_name = u_name;
ELSE 
    raise notice 'Delete avaible only with pairs of items ->
    u_phone and u_name or surn and name';
END IF;
END;
$$;


SELECT * FROM contacts_funcs.contacts;
CALL contacts_funcs.add_contact('Dmitry');
CALL contacts_funcs.add_contact('Alex', '8800');
SELECT * FROM contacts_funcs.contacts;
CALL contacts_funcs.delete_contact('8800', 'Alex');
SELECT * FROM contacts_funcs.contacts;