class CreateFixtures < ActiveRecord::Migration
  def change
    create_table :fixtures do |t|
      t.integer :team_one_id, index: true
      t.integer :team_two_id, index: true
      t.integer :tournament_phase_id, index: true
      t.integer :points_team_one
      t.integer :points_team_two
      t.integer :time_left
      t.boolean :active
      t.string  :state
      t.text    :comment

      # Notifications
      t.boolean :emailed,     default: false
      t.boolean :facebooked,  default: false
      t.boolean :twitted,     default: false
      t.boolean :notified,    default: false
      t.timestamps null: false
    end
  end
end
