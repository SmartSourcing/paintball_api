class CreateTournamentDates < ActiveRecord::Migration
  def change
    create_table :tournament_dates do |t|

      t.text      :description, null: false
      t.boolean   :active, default: false
      t.datetime  :started_at, null: false
      t.datetime  :finished_at, null: false
      t.datetime  :close_draw_at, null: false
      t.string    :contact, null: false
      t.string    :place
      t.string    :link_to_facebook
      t.string    :link_to_twitter

      t.references  :tournament, index: true
      t.timestamps
    end
  end
end
