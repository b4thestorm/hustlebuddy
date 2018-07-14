class AddConsumeToMeds < ActiveRecord::Migration[5.2]
  def change
    add_column :meds, :consume, :datetime
  end
end
