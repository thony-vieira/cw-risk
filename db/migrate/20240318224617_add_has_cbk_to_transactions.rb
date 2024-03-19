class AddHasCbkToTransactions < ActiveRecord::Migration[7.1]
  def change
    add_column :transactions, :has_cbk, :boolean
  end
end
