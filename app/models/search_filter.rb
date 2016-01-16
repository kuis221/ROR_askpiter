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
    filters << build_search_filter(params) if params[:search]
    filters
  end

  def self.build_category_filter( params )
    cat = SubCategory.find_by_id( params[:category_id] )
    SearchFilter.new( name: cat.name, type: :category_id, id: cat.id, obj: cat )
  end

  def self.build_search_filter( params )
    SearchFilter.new( name: params[:search], type: :search )
  end
end
