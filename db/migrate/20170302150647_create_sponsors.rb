class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string  :name, null: false
      t.string  :logo, null: false
      t.string  :web_link
      t.string  :facebook_link
      t.string  :twitter_link
      t.boolean :home_sponsor, default: false

      t.timestamps
    end
  end
end
