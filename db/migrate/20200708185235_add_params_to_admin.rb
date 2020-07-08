class AddParamsToAdmin < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :name, :string
    add_column :admins, :username, :string
    add_index :admins, :username, unique: true
    add_column :admins, :super, :boolean
  end
end
