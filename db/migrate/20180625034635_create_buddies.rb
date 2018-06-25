class CreateBuddies < ActiveRecord::Migration[5.2]
  def change
    create_table :buddies do |t|
      t.string :name
      t.string :email
      t.text :goal

      t.timestamps
    end
  end
end
