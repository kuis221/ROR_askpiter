class SearchFilter

  attr_accessor :name, :type, :id, :obj

  def initialize(init)
    init.each_pair do |key, val|
      instance_variable_set('@' + key.to_s, val)
    end
  end

  def self.build( params )

    filters = Array.new
    filters << build_category_filter(params) if params[:category_id]
    filters << build_company_filter(params) if params[:company_id]
    filters << build_search_filter(params) if params[:search] and !params[:search].blank?
    filters
  end

  def self.build_category_filter( params )
    cat = SubCategory.find_by_id( params[:category_id] )
    SearchFilter.new( name: cat.name, type: :category_id, id: cat.id, obj: cat )
  end

  def self.build_company_filter( params )
    company = Company.find_by_id( params[:company_id] )
    SearchFilter.new( name: company.name, type: :company_id, id: company.id, obj: company )
  end

  def self.build_search_filter( params )
    SearchFilter.new( name: params[:search], type: :search )
  end
end
