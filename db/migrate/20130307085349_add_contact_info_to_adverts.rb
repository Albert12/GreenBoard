class AddContactInfoToAdverts < ActiveRecord::Migration
  def change
  	add_column :adverts, :email, :string
  	add_column :adverts, :phone, :string
  	add_column :adverts, :icq, :string
  	add_column :adverts, :skype, :string
  	add_column :adverts, :name, :string
  end
end
