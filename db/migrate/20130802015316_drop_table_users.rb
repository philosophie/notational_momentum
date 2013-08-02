class DropTableUsers < ActiveRecord::Migration
  def up
    drop_table :users
  end

  def down
   create_table "users", :force => true do |t|
     t.string   "email"
     t.string   "password_digest"
     t.datetime "created_at",      :null => false
     t.datetime "updated_at",      :null => false
   end

  end
end
