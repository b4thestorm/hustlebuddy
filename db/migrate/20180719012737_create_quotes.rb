class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :phrase
      t.integer :count

      t.timestamps
    end
  end
end
