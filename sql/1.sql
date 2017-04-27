create trigger tg_radar_delete_invalid after insert
on radar for each row
execute procedure radar_delete_invalid();