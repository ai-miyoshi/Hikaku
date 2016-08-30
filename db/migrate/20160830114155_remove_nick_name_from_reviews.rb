class RemoveNickNameFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :nickname, :text
  end
end
