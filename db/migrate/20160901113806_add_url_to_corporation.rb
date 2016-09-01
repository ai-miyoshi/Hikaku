class AddUrlToCorporation < ActiveRecord::Migration
  def change
    add_column :corporations, :c_url, :text
  end
end
