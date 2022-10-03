class CreateAddImagesToPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :add_images_to_posts do |t|
      t.string :status

      t.timestamps
    end
  end
end
