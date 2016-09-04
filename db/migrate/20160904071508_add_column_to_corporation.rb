class AddColumnToCorporation < ActiveRecord::Migration
  def change
    add_column :corporations, :image_url, :text
  end
end
