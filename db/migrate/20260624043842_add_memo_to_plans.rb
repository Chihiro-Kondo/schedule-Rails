class AddMemoToPlans < ActiveRecord::Migration[7.2]
  def change
    add_column :plans, :memo, :string
  end
end
