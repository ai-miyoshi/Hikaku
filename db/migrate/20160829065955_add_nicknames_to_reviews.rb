class AddNicknamesToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :nickname, :text
    add_column :reviews, :rate, :integer
    add_column :reviews, :product_id, :integer
  end
end
