class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews

  # 入力値があるかを検証。必須項目にしたいものを記載する
  validates :name, presence: true
  validates :nickname, presence: true
  validates :birth_day, presence: true
  validates :sex, presence: true
  validates :profession, presence: true
  validates :office_name, presence: true
end
