class RenameDesctiptionColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :desctiption, :description
  end
end
