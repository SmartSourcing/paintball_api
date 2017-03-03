class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|

      t.string :name, null: false
      t.string :logo
      t.string :facebook_link
      t.string :twitter_link
      t.string :country, null: false
      t.string :locale, default: 'es'

      t.references :category, index: true
      t.timestamps null: false
    end
  end
end
