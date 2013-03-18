ActiveAdmin.register Advert do

	filter :category, as: :select, collection: proc {
    collection = []
    Category.all.each{ |x|
      x[:name] = x.parentcategory.name + " / " + x.name if x.parentcategory.present?
      collection << x
    }
    collection
  }
	filter :content, as: :string
	filter :created_at, as: :date_range
	filter :updated_at, as: :date_range
	filter :email, as: :string
	filter :phone, as: :string
	filter :icq, as: :string
	filter :skype, as: :string
	filter :name, as: :string

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
        row :category do |advert|
        	advert.category.title
        end
      end
      active_admin_comments
    end

    index do
      	column :id
      	column :content
      	column :created_at
      	column :updated_at
      	column :contacts do |advert|
      		div do 'Name: ' + advert.name end
      		div do 'Phone: ' + advert.phone end
      		div do 'Skype: ' + advert.skype end
      		div do 'Email: ' + advert.email end
      		div do 'ICQ: ' + advert.icq end
      	end
      	column "Category", sortable: :category_id do |advert|
      	advert.category.title
      	end
      	default_actions
    end

    form :partial => "form"

end
