class UpdateHotelsTable < ActiveRecord::Migration[6.1]
  def change
    add_reference :hotels, :user, foreign_key: true
  end
end
