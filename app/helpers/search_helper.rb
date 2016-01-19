module SearchHelper

  def update_params( params, action, key, value = nil )
    p = params.clone
    p.delete(:controller)
    p.delete(:action)
    p.delete(:delete_search)
    p.delete(:category_id) if action == :update and key == :sub_category_id
    p.delete(:sub_category_id) if action == :update and key == :category_id
    p.delete(key) if action == :remove
    p[key] = value if action == :update
    p
  end

  def search_link( name = nil, param_changes = nil, html_options = nil, &block )

    # Handle the case where param_changes is the first argument (block provided so no name)
    if name.kind_of?( Array ) 
      html_options = param_changes
      param_changes = name
      name = nil
    end
    html_options = {} if html_options.nil?

    p = params.clone
    param_changes.each do |change|
      p = update_params( p, change[:action], change[:key], change[:value] )
    end
    html_options[:data] = { 'turbolinks-scroll': false }
    if name.nil?
      link_to search_index_path( p ), html_options, &block
    else
      link_to name, search_index_path( p ), html_options, &block
    end
  end

  def param_change( action, key, value = nil )
    { action: action, key: key, value: value }
  end

  def search_company_link( company, param_company_id, &block )
    if company.id == param_company_id.to_i 
      param_changes = [param_change( :remove, :company_id )]
    else
      param_changes = [param_change( :update, :company_id, company.id )]
    end
    search_link param_changes, {}, &block
  end

  def search_category_link( category, param_category_id, &block )
    if category.id == param_category_id.to_i 
      param_changes = [param_change( :remove, :category_id )]
    else
      param_changes = [param_change( :update, :category_id, category.id )]
    end
    search_link param_changes, {}, &block
  end

  def search_sub_category_link( sub_category, param_sub_category_id, &block )
    if sub_category.id == param_sub_category_id.to_i 
      param_changes = [param_change( :remove, :sub_category_id ), param_change( :update, :category_id, sub_category.category.id )]
    else
      param_changes = [param_change( :update, :sub_category_id, sub_category.id )]
    end
    search_link nil, param_changes, { class: 'sub-filter-checkbox' }, &block
  end


end
