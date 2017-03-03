class CreateTournamentPhases < ActiveRecord::Migration
  def change
    create_table :tournament_phases do |t|
      t.boolean :active, default: true

      t.references :phase, index: true
      t.references :tournament, index: true
      t.references :tournament_dates, index: true
      t.timestamps null: false
    end
  end
end
