class AddSelectorToListing < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :selector, :string
  end
end
