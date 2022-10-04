class AddRequestToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :request, :integer, default: 0
  end
end
