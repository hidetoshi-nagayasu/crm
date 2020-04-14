class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :phone_number, limit: 20
      t.string :mobile_number, limit: 20
      t.string :email
      t.integer :age, limit: 1
      t.string :zip_code, limit: 7
      t.integer :prefecture_code, limit: 1
      t.string :city
      t.string :street
      t.string :building
      t.boolean :is_deleted, null: false, default: 0
      t.integer :created_by, null: false, limit: 8
      t.integer :updated_by, limit: 8
      t.timestamps
    end
  end
end
