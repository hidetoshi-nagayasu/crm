class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :title, null: false
      t.text :description
      t.integer :sales, null: false
      t.references :customer, null: false, foreign_key: true
      t.references :status, null: false, foreign_key: true
      t.date :start_date
      t.date :delivery_date
      t.boolean :is_deleted, null: false, default: 0
      t.integer :created_by, null: false, limit: 8
      t.integer :updated_by, limit: 8

      t.timestamps
    end
  end
end
