delete from radar where lon = '0.0' or lat = '0.0';
select radar_f_delete_invalid()


CREATE OR REPLACE FUNCTION radar_f_delete_invalid()
  RETURNS void AS
' delete from radar where lon = ''0.0'' or lat = ''0.0''; '
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION radar_f_delete_invalid()
  OWNER TO postgres;