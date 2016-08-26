class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name
      t.text :image_url
      t.text :product_url

      t.timestamps
    end
  end
end
