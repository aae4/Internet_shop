class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
		t.string :login
		t.string :email
		t.string :password
		t.datetime :created_at
		t.string :bday
		t.string :bmounth
		t.string :byear
		t.string :gender

    	t.timestamps
    end

	User.create(:login => 'admin',
				:password => 'adminn',
				:email => 'admin@server.com'
			   )
  end


  def self.down
    drop_table :users
  end
end
