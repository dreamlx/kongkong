class CreateShareContexts < ActiveRecord::Migration
  def change
    create_table :share_contexts do |t|
      t.string :apk_url
      t.string :context
      t.timestamps
    end
  end
end
