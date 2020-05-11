class AddColumnToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :gender, :integer, limit: 1
  end
end
