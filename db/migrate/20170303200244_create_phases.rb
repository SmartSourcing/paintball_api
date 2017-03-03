class CreatePhases < ActiveRecord::Migration
  def change
    create_table :phases do |t|

      t.string  :name, null: false
      t.boolean :is_fixture, default: false
      t.string  :description

      t.references :tournament, index: true
      t.timestamps null: false
    end

    add_index :phases, :id
  end
end
