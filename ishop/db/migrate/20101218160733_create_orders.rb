class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
	t.column :status, :integer
	t.column :comment, :text
	t.column :contact, :text
	t.datetime :created_at
	t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
