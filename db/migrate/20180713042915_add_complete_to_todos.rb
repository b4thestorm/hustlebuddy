class AddCompleteToTodos < ActiveRecord::Migration[5.2]
  def change
     add_column :todos, :complete, :integer
  end
end
