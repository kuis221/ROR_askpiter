module AddendumHelper

  def addendum_locals
    @addendum_locals ||= begin
      case
      when params[:product_id]
        product = Product.find_by id: params[:product_id]
        category = product.category
      when params[:category_id]
        category = Category.find_by id: params[:category_id]
        products = category.products
      else
        categories = Category.includes(:products).all
      end
      { product: product, category: category, products: products, categories: categories }
    end
  end

  def addendum_storage prefix
    capture do
      if categories = addendum_locals[:categories]
        data = { owner: "#{prefix}_category_id", dependant: "#{prefix}_product_id" }
        grouped_collection_select nil, nil, categories, :products, :id, :id, :name, {},
                                  name: nil, id: nil, class: 'storage hidden', data: data
      end
    end
  end

  def addendum_selectors form
    capture do
      concat render 'shared/addendum/category', form: form,
        **addendum_locals.slice(:category, :categories)
      concat render 'shared/addendum/product', form: form,
        **addendum_locals.slice(:product, :products)
    end
  end

end
