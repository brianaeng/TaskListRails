class AddUserAttributes < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :string
    add_column :users, :authenticated, :boolean
  end
end
