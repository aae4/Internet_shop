class CreatePremissions < ActiveRecord::Migration
  def self.up
    create_table :premissions do |t|
		t.integer :role_id, :user_id, :null => false
		t.integer :updated_by

      t.timestamps
    end
  end
	
	Role.create(:role_name=>'administrator')
	
	user=User.new
	user.login="admin"
	user.password="password"
	user.password_confirmation="password"
		

  def self.down
    drop_table :premissions
  end
end
