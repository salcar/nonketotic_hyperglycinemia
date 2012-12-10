class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :email,           :null => false
      t.string   :password_digest,    :null => false

      t.boolean  :is_admin, :null => false, :default => false
      t.boolean  :is_active, :null => false, :default => true

      t.timestamps
    end

    add_index :users, :email
  end
end
