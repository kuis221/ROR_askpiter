ActiveAdmin.register SubCategory do

  belongs_to :category, optional: true

  permit_params :name, :category_id

  filter :name
  filter :category
  filter :created_at

  action_item :products, only: :show do
    link_to 'Products', admin_sub_category_products_path(sub_category)
  end

  index do
    id_column
    column :name
    column :category
    column :created_at
    column :updated_at
    actions
  end

end
