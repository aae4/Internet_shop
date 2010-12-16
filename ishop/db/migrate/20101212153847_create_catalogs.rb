class CreateCatalogs < ActiveRecord::Migration
  def self.up
    create_table :catalogs do |t|
      t.column :name, :text, :null => false
      t.column :about, :text
      
      t.timestamps
    end
  end

  def self.down
    drop_table :catalogs
  end
end
