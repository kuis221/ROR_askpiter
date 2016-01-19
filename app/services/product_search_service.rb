class ProductSearchService

  attr_accessor :search_string, :category_id, :sub_category_id, :company_id, :start_row_index, :take_count, :products, :has_more

  def initialize( params )
    self.search_string = params[:search]
    self.category_id = params[:category_id]
    self.sub_category_id = params[:sub_category_id]
    self.company_id = params[:company_id]
    self.start_row_index = params[:start_row_index] ? params[:start_row_index].to_i : 0
    self.take_count = self.start_row_index == 0 ? 16 : 8
  end

  def search
    self.products = Product.search( search_string, category_id, sub_category_id, company_id, start_row_index, take_count )
    self.has_more = Product.search_count( search_string, category_id, sub_category_id, company_id ) > self.products.length + self.start_row_index
    self
  end

  def no_results?
    start_row_index == 0 && products.length == 0
  end

end
