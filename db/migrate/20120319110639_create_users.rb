class CreateUsers < ActiveRecord::Migration
  def change
    create_table "users", :force => true do |t|
      t.string   "username",   limit: 30
      t.string   "email",   limit: 30
      t.string   "encrypted_password",   limit: 100
      t.string   "salt",   limit: 50
      t.string   "relationship",   limit: 50,         :null => true
      t.datetime "created_at",         :null => false
      t.datetime "updated_at",         :null => false
    end
  end
end
