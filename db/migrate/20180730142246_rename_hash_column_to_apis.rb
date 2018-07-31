class RenameHashColumnToApis < ActiveRecord::Migration[5.2]
  def change
    rename_column :apis, :hash, :hash_i
  end
end
