module ApplicationHelper

  def modal_button_for action_name, button_text
    content_tag :button, button_text, type: 'button',
                class: 'show-modal btn btn-primary',
                data: { action: action_name }
  end

end
