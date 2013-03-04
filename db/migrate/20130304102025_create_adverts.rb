class CreateAdverts < ActiveRecord::Migration
  def change
    create_table :adverts do |t|
      t.string :content

      t.timestamps
    end
  end
end
