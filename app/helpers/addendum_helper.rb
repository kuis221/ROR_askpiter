module AddendumHelper

  def addendum_storage addendum_locals, prefix
    return unless categories = addendum_locals.categories
    capture do

      data = { owner: "#{prefix}_category_id", dependant: "#{prefix}_product_id" }
      grouped_collection_select nil, nil, categories, :products, :id, :id, :name, {},
                                name: nil, id: nil, class: 'storage hidden', data: data

    end
  end

  def addendum_selectors addendum_locals, form
    capture do

      concat render 'shared/addendum/category', form: form,
        category: addendum_locals.category, categories: addendum_locals.categories

      concat render 'shared/addendum/product', form: form,
        product: addendum_locals.product, products: addendum_locals.products

    end
  end

end
