class CreateVisitHistories < ActiveRecord::Migration
  def change
    create_table :visit_histories do |t|
      t.references :dailypost
      t.references :user
      t.string :state
      t.integer :visit_count

      t.timestamps
    end
  end
end
