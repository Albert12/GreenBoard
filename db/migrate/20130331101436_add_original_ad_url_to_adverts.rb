class AddOriginalAdUrlToAdverts < ActiveRecord::Migration
  def change
    add_column :adverts, :original_ad_url, :string
  end
end
