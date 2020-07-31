module ApplicationHelper
  def bootstrap_class_for(flash_type)
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def error_for(object)
    if object.errors.any?
      content_tag(:ul) do
        object.errors.full_messages.each do |msg|
          concat content_tag(:li, msg, style: 'color: red')
        end
      end
    end
  end
end
