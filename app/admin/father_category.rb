ActiveAdmin.register FatherCategory do

  permit_params :name

  filter :name
  filter :created_at

  index do
    id_column
    column :name
    column :created_at
    column :updated_at
    actions do |father_category|
      link_to 'Categories', admin_categories_path(q: { father_category_id_eq: father_category.id })
    end
  end

end
