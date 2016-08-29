class AddUsePeriodToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :use_period, :integer
  end
end
