select * from pg_stat_activity;

select * from pg_user;

select unnest('{{1,2,3},{4,5,6}}'::int[])

select * from xtable;

select table_to_json('radar',true,false, '') as s limit 2;

select row_to_json('select * from radar limit 1');