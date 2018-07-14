class CreateMeds < ActiveRecord::Migration[5.2]
  def change
    create_table :meds do |t|
      t.timestamps
    end
  end
end
