class AddCategoryIdToAdverts < ActiveRecord::Migration
  def change
    add_column :adverts, :category_id, :integer
  end
end
