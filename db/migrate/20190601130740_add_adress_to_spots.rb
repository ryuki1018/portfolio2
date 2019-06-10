class AddAdressToSpots < ActiveRecord::Migration[5.2]
  def change
    add_column :spots, :adress, :string
  end
end
