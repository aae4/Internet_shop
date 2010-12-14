class CreateGoods < ActiveRecord::Migration
  def self.up
    create_table :goods do |t|
      t.column :name, :text, :null => false 
      t.column :size_x, :float
      t.column :size_y, :float
      t.column :size_z, :float
      t.column :weight, :float
      t.column :about, :text
      t.column :price, :float
      t.column :quant, :integer
      t.column :provider, :text
      
      t.references :catalog

      t.timestamps
    end
    Good.create(:name => "Колбаса",
	:size_x => "10",
	:size_y => "60",
	:size_z => "10",
	:weight => "68",
	:about => "Сруль, лучшая колбаса, едрит-коптить!",
	:price => "123",
	:quant => "5",
	:provider => "ЭкоПром",
	:catalog_id => "1"
	)
end

  def self.down
    drop_table :goods
  end
end
