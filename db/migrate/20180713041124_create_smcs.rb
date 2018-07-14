class CreateSmcs < ActiveRecord::Migration[5.2]
  def change
    create_table :smcs do |t|
      t.timestamps
    end
  end
end
