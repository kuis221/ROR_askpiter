module SearchHelper

  def update_params( params, action, key, value = nil )
    params.delete(:controller)
    params.delete(:action)
    params.delete(key) if action == :remove
    params[key] = value if action == :update
    params
  end

end
