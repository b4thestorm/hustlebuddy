class AddOptinToBuddies < ActiveRecord::Migration[5.2]
  def change
    add_column :buddies, :optin, :boolean
    add_column :buddies, :phone_number, :string
  end
end
