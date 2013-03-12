class CreateViewsCounters < ActiveRecord::Migration
  def change
    create_table :views_counters do |t|
      t.string :view
      t.integer :vcount

      t.timestamps
    end
  end
end
