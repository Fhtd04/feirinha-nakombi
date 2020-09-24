class AddFieldToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :ask, :integer
  end
end
