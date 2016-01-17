module SearchHelper

  def update_params( params, action, key, value = nil )
    p = params.clone
    p.delete(:controller)
    p.delete(:action)
    p.delete(:delete_search)
    p.delete(key) if action == :remove
    p[key] = value if action == :update
    p
  end

end
