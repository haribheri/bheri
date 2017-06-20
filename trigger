create sequence seq_bheri
minvalue 1
maxvalue 1000
start with 1
increment by 1


create or replace trigger tr_student
before insert on student
for each row
declare
val number:=10;
begin
if 20>val then
val:=20;
else
val:=30;
end if;
DBMS_OUTPUT.put_line ('Before Insert Row');
DBMS_OUTPUT.put_line ('Old ID ' || :OLD.id);
DBMS_OUTPUT.put_line ('New ID ' || :NEW.id);

exception 
WHEN no_data_found THEN
      dbms_output.put_line('No such student!');
when others then
NULL;
end;




Trigger Order:

CREATE OR REPLACE TRIGGER trigger_2
BEFORE INSERT ON tbl_1
FOR EACH ROW
BEGIN
  DBMS_OUTPUT.put_line('trigger 2 - Executed');
END;

CREATE OR REPLACE TRIGGER trigger_1
BEFORE INSERT ON tbl_1
FOR EACH ROW
FOLLOWS trigger_2
BEGIN
  DBMS_OUTPUT.put_line('trigger 1 - Executed');
END;

INSERT INTO tbl_1 VALUES (1, 'ONE');

trigger 2 - Executed
trigger 1 - Executed
