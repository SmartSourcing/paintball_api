class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|

      t.string  :name, null: false
      t.text    :description
      t.boolean :active, default: true
      t.integer :minutes_to
      t.integer :career_to

      t.timestamps
    end
  end
end
