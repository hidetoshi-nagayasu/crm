class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|

      t.string :last_name, null: false
      t.string :first_name, null: false
      t.date :birthday
      t.boolean :has_spouse
      t.string :zip_code, limit: 8
      t.integer :prefecture_code, limit: 1
      t.string :city
      t.string :street
      t.string :building
      t.string :phone_number, limit: 20
      t.string :mobile_number, limit: 20
      t.references :department, null: false, foreign_key: true
      t.boolean :is_deleted, null: false, default: 0
      t.integer :created_by, null: false, limit: 8
      t.integer :updated_by, limit: 8

      t.timestamps
    end
  end
end
