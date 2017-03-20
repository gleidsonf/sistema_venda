class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.decimal :price, precision: 12, scale: 2
      t.boolean :active

      t.timestamps
    end
  end
end
