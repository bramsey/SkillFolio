class AddAliasToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :alias, :string
    add_index :users, :alias, :unique => true
  end

  def self.down
    remove_column :users, :alias
  end
end
