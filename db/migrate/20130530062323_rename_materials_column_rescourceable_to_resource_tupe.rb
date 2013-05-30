class RenameMaterialsColumnRescourceableToResourceTupe < ActiveRecord::Migration
  def change
    rename_column :materials, :resourceable, :resource_type
    rename_column :materials, :resourceable_id, :resource_id
    rename_column :materials, :attechment, :attachment
  end 
end
