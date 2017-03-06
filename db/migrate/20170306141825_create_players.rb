class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|

      t.string  :firstname
      t.string  :lastname
      t.string  :nickname
      t.string  :dob
      t.string  :number
      t.string  :nationality
      t.string  :position
      t.string  :logo
      t.string  :passport
      t.integer :age
      t.boolean :captain

      t.timestamps null: false
    end
  end
end
