class CreateOrderEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :order_employees do |t|
      t.references :order, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true
      t.boolean :is_deleted, null: false, default: 0
      t.integer :created_by, null: false, limit: 8
      t.integer :updated_by, limit: 8

      t.timestamps
    end
  end
end
