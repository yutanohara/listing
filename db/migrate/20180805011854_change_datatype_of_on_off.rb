class ChangeDatatypeOfOnOff < ActiveRecord::Migration[5.2]
  def change
    change_column :listings, :on_off, 'boolean USING CAST(on_off AS boolean)'
  end
end
