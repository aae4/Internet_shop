class CreateBuys < ActiveRecord::Migration
  def self.up
    create_table :buys do |t|
	t.column :quant, :integer 

	t.references :good
	t.references :order

      t.timestamps
    end
  end

  def self.down
    drop_table :buys
  end
end
