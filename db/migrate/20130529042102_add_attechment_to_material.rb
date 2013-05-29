class AddAttechmentToMaterial < ActiveRecord::Migration
  def change
    add_column :materials, :attechment, :string
  end
end
