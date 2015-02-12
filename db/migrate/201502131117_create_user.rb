class CreateUser < ActiveRecord::Migration
  create_table :users do |t|
    t.string  :email
    t.string  :password_hash

    t.timestamps
  end

end
