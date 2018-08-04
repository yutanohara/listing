class RemoveColumnFromLisings < ActiveRecord::Migration[5.2]
  def change
    remove_column :listings, :location, :string
    remove_column :listings, :li_hash, :string
    rename_column :listings, :selector, :on_off
  end
end
