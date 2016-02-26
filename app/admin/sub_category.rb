ActiveAdmin.register SubCategory do

  belongs_to :category, optional: true

  permit_params :name, :category_id, filters_attributes: [:id, :sub_category_id, :name, :_destroy]

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

  show do |order|
    attributes_table do
      row :name
      row :category
    end
    table_for sub_category.filters, sortable: true, class: 'index_table' do
      column :filters do |fo|
        fo.name
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :category
      f.input :name
    end

    f.inputs "Filters" do
      f.has_many :filters, allow_destroy: true, new_record: true do |fo|
        fo.input :name
      end
    end

    f.actions

  end

end
