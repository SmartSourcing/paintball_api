class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :name, null: false
      t.string :token, null: false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
