class CreateSystemRecords < ActiveRecord::Migration
  def change
    create_table :system_records do |t|
      t.column :name, :string, :default => "", :null => false
      t.column :value, :string, :default => "", :null => false
      t.column :created_at, :datetime, :null => false
      t.column :updated_at, :datetime, :null => false
    end
  end
end
