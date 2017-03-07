class AddCrudAccessToToken < ActiveRecord::Migration
  def change

    add_column :tokens, :read,    :boolean, default: true
    add_column :tokens, :write,   :boolean, default: false
    add_column :tokens, :erase,   :boolean, default: false
  end
end
