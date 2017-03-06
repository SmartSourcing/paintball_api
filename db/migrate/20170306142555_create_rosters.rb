class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|

      t.string :category
      t.integer :year
      t.references :tournament_date, index: true
      t.references :player, index: true
      t.timestamps null: false
    end
  end
end
