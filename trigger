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
