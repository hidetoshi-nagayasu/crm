class ChangeDatatypeZipCodeOfCustomer < ActiveRecord::Migration[6.0]
  def change
    change_column :customers, :zip_code, :string, limit: 8
  end
end
