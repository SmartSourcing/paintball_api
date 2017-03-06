class CreateGears < ActiveRecord::Migration
  def change
    create_table :gears do |t|

      t.string  :category, null: false
      t.string  :name, null: false
      t.integer :year

      t.references :manufacturer, index: true
      t.timestamps null: false
    end
  end
end
