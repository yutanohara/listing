class RenameHashColumnToListings < ActiveRecord::Migration[5.2]
  def change
    rename_column :listings, :hash, :li_hash
  end
end
