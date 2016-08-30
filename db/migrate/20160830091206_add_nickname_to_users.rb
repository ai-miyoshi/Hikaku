class AddNicknameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    add_column :users, :name, :string
    add_column :users, :profession, :string
    add_column :users, :sex, :string
    add_column :users, :birth_day, :string
    add_column :users, :office_name, :string
    add_column :users, :office_tel, :string
  end
end
