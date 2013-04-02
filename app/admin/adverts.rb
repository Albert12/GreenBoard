# encoding: utf-8
ActiveAdmin.register Advert do

	filter :category, as: :select, collection: Category.allcategories
	filter :content, as: :string
	filter :created_at, as: :date_range
	filter :updated_at, as: :date_range
	filter :email, as: :string
	filter :phone, as: :string
	filter :icq, as: :string
	filter :skype, as: :string
	filter :name, as: :string
  filter :price
  filter :original_ad_url, as: :string

	show do
      attributes_table do
      	row :id
      	row :content
      	row :created_at
      	row :updated_at
        row :name
        row :phone
        row :skype
        row :email
        row :icq
        row :price
        row :original_ad_url
        row :category do |advert|
        	advert.category.title
        end
      end
      active_admin_comments
    end

    index do
      	column :id
      	column :content
        column "Price, RUR", :price
        column :original_ad_url
      	column :created_at
      	column :updated_at
      	column :contacts do |advert|
      		div do 'Name: ' + advert.name.to_s end
      		div do 'Phone: ' + advert.phone.to_s end
      		div do 'Skype: ' + advert.skype.to_s end
      		div do 'Email: ' + advert.email.to_s end
      		div do 'ICQ: ' + advert.icq.to_s end
      	end
      	column "Category", sortable: :category_id do |advert|
      	advert.category.title
      	end
      	default_actions
    end

    form do |f|

        f.inputs "Contacts" do
          f.input :name
          f.input :phone
          f.input :skype
          f.input :email
          f.input :icq
        end

        f.inputs "Category" do
          f.input :category, as: :select, collection: Category.allcategories, include_blank: "Select category"
        end

        f.inputs "Content" do
            f.input :content
        end

        f.inputs "Price, RUR" do
            f.input :price
        end        

        f.buttons
      end

end
