class Question < ActiveRecord::Base
#association
belongs_to :product
belongs_to :user

  #validation：値がからでないことを確認する
  validates_presence_of :user_id, :text, :product_id
end
