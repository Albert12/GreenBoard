class CreateViewsCounters < ActiveRecord::Migration
  def change
    create_table :views_counters do |t|
      t.string :viewable_type
      t.string :viewable_id
      t.integer :views_count

      t.timestamps
    end
  end
end
