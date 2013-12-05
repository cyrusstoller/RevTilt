module ApplicationHelper
  def bootstrap_alert_type(type)
    case type
    when :alert, "alert"
      "danger"
    when :error, "error"
      "danger"
    when :notice, "notice"
      "warning"
    when :success, "success"
      "success"
    else
      type.to_s
    end
  end
  
  def title
    base_title = "RevTilt"
    if @title.blank?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
