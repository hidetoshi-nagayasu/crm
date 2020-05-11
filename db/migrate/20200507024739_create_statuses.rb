class CreateStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :statuses do |t|
      t.string :name
      t.text :description
      t.boolean :is_deleted, null: false, default: 0
      t.integer :created_by, null: false, limit: 8
      t.integer :updated_by, limit: 8

      t.timestamps
    end
  end
end
