ActiveAdmin.register Category do

  belongs_to :user, optional: true
  belongs_to :father_category, optional: true

  permit_params :name, :father_category_id

  action_item :sub_categories, only: :show do
    link_to 'Sub Categories', admin_category_sub_categories_path(category)
  end

  filter :name
  filter :father_category
  filter :created_at

  index do
    id_column
    column :name
    column :father_category
    column :created_at
    column :updated_at
    actions
  end

end
