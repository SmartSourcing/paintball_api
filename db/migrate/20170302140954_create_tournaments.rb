class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string    :name, null: false
      t.string    :nickname, null: false
      t.datetime  :started_at, null: false
      t.datetime  :finished_at, null: false
      t.string    :tournament_type, null: false
      t.string    :country, null: false
      t.string    :logo, null: false
      t.boolean   :active, default: true
      t.string    :hashtag_cloud
      t.string    :facebook_link
      t.string    :twitter_link
      t.string    :web_site

      t.timestamps null: false
    end

    add_index :tournaments, :id
  end
end
