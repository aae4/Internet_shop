class CreateTrashes < ActiveRecord::Migration
  def self.up
    create_table :trashes do |t|
	t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :trashes
  end
end
