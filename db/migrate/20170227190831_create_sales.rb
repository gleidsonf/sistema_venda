class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.decimal :subtotal, precision: 12, scale: 2
      t.decimal :discount, precision: 12, scale: 2
      t.decimal :total, precision: 12, scale: 2
      t.references :sale_status, foreign_key: true
      t.references :payment, foreign_key: true

      t.timestamps
    end
  end
end
