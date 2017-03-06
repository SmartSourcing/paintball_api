class CreateJoinTablePlayerGear < ActiveRecord::Migration
  def change

    create_join_table :players, :gears do |t|

       t.index [:player_id, :gear_id]
       t.index [:gear_id, :player_id]
    end
  end
end
