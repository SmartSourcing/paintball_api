class AddStoredProcedureForCube < ActiveRecord::Migration
  def change
    execute <<-SPROC
    CREATE OR REPLACE FUNCTION generate_players_data()
    RETURNS void AS
    $$

    BEGIN

      DROP TABLE IF EXISTS tmp_cube_players;

      CREATE TABLE tmp_cube_players  AS
        SELECT DISTINCT
          players.id as player_id,
          gears.id  as marker_id,
          gears.manufacturer_id as manufacturer_id,
          nationality
        FROM players
          inner join gears_players on players.id = gears_players.player_id
		      inner join gears on gears.id = gears_players.gear_id;

      ALTER TABLE tmp_cube_players
          OWNER TO paintballapi;

    END;
    $$ LANGUAGE plpgsql;
    SPROC
  end
end
