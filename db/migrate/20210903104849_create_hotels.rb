class CreateHotels < ActiveRecord::Migration[6.1]
  def change
    create_table :hotels do |t|
      t.string :title
      t.string :description
      t.string :image_url

      t.timestamps
    end
  end
end
