class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :property_status,         null: false, default: ""
      t.string :owner_name,              null: false, default: ""
      t.string :location,                null: false, default: ""
      t.string :size,                    null: false, default: ""
      t.string :price,                   null: false, default: ""
      t.string :description,             null: false, default: ""
      t.string :phone,                   null: false, default: ""
      t.string :email,                   null: false, default: ""
      t.references :user,                null: false, foreign_key: true

      t.timestamps
    end
  end
end
