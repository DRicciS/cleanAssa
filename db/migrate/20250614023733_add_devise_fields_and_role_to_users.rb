class AddDeviseFieldsAndRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    # Add Devise's columns to the existing users table
    change_table :users do |t|
      ## Database authenticatable
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Add the role column
      t.string :role
    end

    # Add indexes for the new columns
    add_index :users, :reset_password_token, unique: true
  end
end
