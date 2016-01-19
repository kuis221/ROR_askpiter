ActiveAdmin.register Category do

  belongs_to :user, optional: true

  permit_params :name, :father_category_id

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
