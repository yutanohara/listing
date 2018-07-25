class AddLocationToListing < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :location, :string
    add_column :listings, :hash, :string
  end
end
