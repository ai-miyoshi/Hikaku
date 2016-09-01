class Product < ActiveRecord::Base
  has_many :reviews
  belongs_to :corporation

  def review_average
    reviews.average(:rate).round
  end

end
