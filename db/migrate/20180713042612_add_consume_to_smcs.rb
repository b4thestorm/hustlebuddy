class AddConsumeToSmcs < ActiveRecord::Migration[5.2]
  def change
    add_column :smcs, :consume, :datetime
  end
end
