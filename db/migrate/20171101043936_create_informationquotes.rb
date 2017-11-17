class CreateInformationquotes < ActiveRecord::Migration[5.1]
  def change
    create_table :informationquotes do |t|
      t.string :value
      t.references :quote, foreign_key: true
      t.references :attributeproduct, foreign_key: true

      t.timestamps
    end
  end
end
