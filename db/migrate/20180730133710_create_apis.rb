class CreateApis < ActiveRecord::Migration[5.2]
  def change
    create_table :apis do |t|
      t.string :host
      t.string :path
      t.string :hash
      t.string :location
      t.integer :listing

      t.timestamps
    end
  end
end
