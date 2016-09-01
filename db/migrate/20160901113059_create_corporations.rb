class CreateCorporations < ActiveRecord::Migration
  def change
    create_table :corporations do |t|
      t.string :corporate_name
      t.timestamps
    end
  end
end
