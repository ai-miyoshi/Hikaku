class AddCorporationIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :corporation_id, :integer
  end
end
