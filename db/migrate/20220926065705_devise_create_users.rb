# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :first_name,         null: false, default: ""
      t.string :last_name,          null: false, default: ""
      t.string :phone,              null: false, default: ""      
      
      
      
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at

      t.integer :role, default: 0

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :first_name
    add_index :users, :last_name
    add_index :users, :phone
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end


## Post  
    # create_table :posts do |t|
    # t.references :user, null: false, foreign_key: true

    # t.string :property_status,         null: false, default: ""
    # t.string :owner_name,              null: false, default: ""
    # t.string :location,                null: false, default: ""
    # t.string :size,                    null: false, default: ""
    # t.string :price,                   null: false, default: ""
    # t.string :description,             null: false, default: ""
    # t.string :phone,                   null: false, default: ""
    # t.string :email,                   null: false, default: ""
    
    # 20220928102732_vreate_postd.rb

    # class CreatePosts < ActiveRecord::Migration[7.0]
    #   def change
    #     create_table :posts do |t|
    #       t.string :property_status,         null: false, default: ""
    #       t.string :owner_name,              null: false, default: ""
    #       t.string :location,                null: false, default: ""
    #       t.string :size,                    null: false, default: ""
    #       t.string :price,                   null: false, default: ""
    #       t.string :description,             null: false, default: ""
    #       t.string :phone,                   null: false, default: ""
    #       t.string :email,                   null: false, default: ""
          
    
    #       t.timestamps
    #     end
    #   end
    # end
