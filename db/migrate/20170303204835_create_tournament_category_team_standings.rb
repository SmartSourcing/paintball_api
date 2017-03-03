class CreateTournamentCategoryTeamStandings < ActiveRecord::Migration
  def change
    create_table :tournament_category_team_standings do |t|

      t.integer :wins, null: false
      t.integer :losts, null: false
      t.integer :ties, null: false
      t.integer :year, null: false
      t.integer :position, null: false

      t.references :tournament, index: true
      t.references :category, index: true
      t.references :team, index: true
      t.timestamps null: false
    end
  end
end
