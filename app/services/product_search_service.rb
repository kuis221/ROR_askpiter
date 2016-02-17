class ProductSearchService

  attr_accessor :search_string, :sub_categories, :companies, :start_row_index, :take_count, :products, :has_more

  def initialize( params )
    self.search_string = params[:search]
    self.sub_categories = params[:sub_categories]
    self.companies = params[:companies]
    self.start_row_index = params[:start_row_index] ? params[:start_row_index].to_i : 0
    self.take_count = self.start_row_index == 0 ? 16 : 8
  end

  def search
    self.products = Product.search( search_string, sub_categories, companies, start_row_index, take_count )
    self.has_more = Product.search_count( search_string, sub_categories, companies ) > self.products.length + self.start_row_index
    self
  end

  def no_results?
    start_row_index == 0 && products.length == 0
  end

end
