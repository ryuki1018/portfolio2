class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :prefecture
      t.string :city
      t.string :name
      t.string :content
      t.string :image

      t.timestamps
    end
  end
end
