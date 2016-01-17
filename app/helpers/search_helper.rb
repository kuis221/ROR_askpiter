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

end
