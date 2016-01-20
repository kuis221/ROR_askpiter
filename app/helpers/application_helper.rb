module ApplicationHelper

  def modal_button_for action_name, button_text, **data_attrs
    content_tag :button, type: 'button', class: 'show-modal btn btn-primary' do
      form = capture do
        form_tag modals_path(action_name), class: 'hidden' do
          data_attrs.merge(action: action_name).each do |key, value|
            concat hidden_field_tag key, value, id: nil
          end
        end
      end
      concat button_text
      concat form
    end
  end

end
