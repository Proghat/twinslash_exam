class RenameCompletedToCompletionInOrders < ActiveRecord::Migration
  def change
    change_table :orders do |t|
      t.rename :completed, :completion
    end
  end
end
