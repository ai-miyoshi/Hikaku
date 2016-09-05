class Product < ActiveRecord::Base
  has_many :reviews
  belongs_to :corporation

  # タグに関する記述
  acts_as_taggable_on :labels # post.label_list が追加される
  acts_as_taggable            # acts_as_taggable_on :tags のエイリアス

  def review_average
    reviews.average(:rate).round
  end

end
