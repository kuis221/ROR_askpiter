ActiveAdmin.register SubCategory do

  belongs_to :category, optional: true

  permit_params :name, :category_id

  filter :name
  filter :category
  filter :created_at

  index do
    id_column
    column :name
    column :category
    column :created_at
    column :updated_at
    actions
  end

end
