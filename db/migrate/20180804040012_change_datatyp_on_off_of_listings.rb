class ChangeDatatypOnOffOfListings < ActiveRecord::Migration[5.2]
  def change
    change_column :listings, :on_off, :boolean
  end
end
