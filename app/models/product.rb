class Product < ActiveRecord::Base
  has_many :reviews
  belongs_to :corporation

  # タグに関する記述
   acts_as_taggable

  def review_average
    reviews.average(:rate).round
  end

end
