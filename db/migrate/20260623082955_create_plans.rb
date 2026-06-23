class CreatePlans < ActiveRecord::Migration[7.2]
  def change
    create_table :plans do |t|
      t.string :title
      t.date :start_day
      t.date :finish_day
      t.boolean :all_day

      t.timestamps
    end
  end
end
