class CreateTypeproducts < ActiveRecord::Migration[5.1]
  def change
    create_table :typeproducts do |t|
      t.string :name
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
