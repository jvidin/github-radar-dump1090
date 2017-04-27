drop function radar_delete_invalid();

CREATE OR REPLACE FUNCTION radar_delete_invalid()
  RETURNS trigger AS
$delete$
declare begin
delete from radar where lon = '0.0' or lat = '0.0';
return null;
end;
$delete$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION radar_delete_invalid()
  OWNER TO postgres;
GRANT EXECUTE ON FUNCTION radar_delete_invalid() TO public;
GRANT EXECUTE ON FUNCTION radar_delete_invalid() TO postgres;