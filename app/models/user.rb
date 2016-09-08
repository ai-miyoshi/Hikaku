class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #association
  has_many :reviews
  has_many :questions, ->{ order("created_at DESC") }
    # orderオプション は取得する順序を変更することのできるオプションで、他の全てのオプションの前に記述します。
    # 今回はgroupとuserに対し設定することで、questionが作られた順にレコードを取得してくれます。

  # 入力値があるかを検証。必須項目にしたいものを記載する
  validates :name, presence: true
  validates :nickname, presence: true
  validates :birth_day, presence: true
  validates :sex, presence: true
  validates :profession, presence: true
  validates :office_name, presence: true
end
