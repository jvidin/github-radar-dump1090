create or replace function 
notify_trigger()
returns trigger AS $$
BEGIN
raise notice '% foi chamado -> FOR % % % on % ',
TG_NAME,TG_LEVEL,TG_WHEN,TG_OP,TG_TABLE_NAME;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;




create table notify_test(i int);

create trigger notify_insert_trigger
after insert on notify_test
for each row
execute procedure notify_trigger();

create trigger notify_update_trigger
after update on notify_test
for each row
execute procedure notify_trigger();

create trigger notify_delete_trigger
after delete on notify_test
for each row
execute procedure notify_trigger();

create trigger notify_action_trigger
after insert or delete or update on notify_test
for each row
execute procedure notify_trigger();


insert into notify_test values (1),(2);

update notify_test set i = i*10;

delete from notify_test;

