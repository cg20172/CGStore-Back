class CreateAttributeproducts < ActiveRecord::Migration[5.1]
  def change
    create_table :attributeproducts do |t|
      t.text :range
      t.references :typeproduct, foreign_key: true
      t.references :feature, foreign_key: true

      t.timestamps
    end
  end
end
