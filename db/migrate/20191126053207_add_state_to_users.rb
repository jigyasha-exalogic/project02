class AddStateToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :state, :string
    add_column :users, :pincode, :number
  end
end
