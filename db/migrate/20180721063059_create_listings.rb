class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :listing_code
      t.string :creative_name
      t.string :ad_name
      t.string :ad_parameter
      t.string :kahen_selector

      t.timestamps
    end
  end
end
