class CreateLevels < ActiveRecord::Migration
  def self.up
    create_table :levels do |t|
      t.text :description
      t.boolean :met, :default => false
      t.datetime :date_met
      t.integer :skill_id

      t.timestamps
    end
  end

  def self.down
    drop_table :levels
  end
end
