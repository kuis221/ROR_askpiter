module ApplicationHelper

  def modal_button_tag content, action = nil, **options
    action, content = content, nil unless action

    modal_mark = 'show-modal'
    if button_class = options.delete(:class)
      button_class.join(' ') if button_class.is_a? Array
      button_class << " #{modal_mark}" unless button_class =~ /\b#{modal_mark}\b/
    else
      button_class = "#{modal_mark} btn btn-primary"
    end

    button_data = options.delete(:data) || {}
    button_data.merge! options.extract! :disable_cache

    button_options = options.extract! :type, :name
    button_options.reverse_merge! type: :button, name: nil

    button_options.merge! data: button_data
    button_options.merge! class: button_class

    options.merge! options.extract! :request_params

    button_tag button_options do
      concat content if content
      concat capture yield if block_given?
      capture do
        form_tag modals_path(action), class: 'hidden' do
          options.each { |key, value| concat hidden_field_tag key, value, id: nil }
        end
      end.tap { |form| concat form }
    end
  end

end
