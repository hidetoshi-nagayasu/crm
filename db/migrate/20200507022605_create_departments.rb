class CreateDepartments < ActiveRecord::Migration[6.0]
  def change
    create_table :departments do |t|
      t.string :name, null: false, unique: true
      t.text :description
      t.boolean :is_deleted, null: false, default: 0
      t.integer :created_by, null: false, limit: 8
      t.integer :updated_by, limit: 8

      t.timestamps
    end
  end
end
