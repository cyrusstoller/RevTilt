module ApplicationHelper
  def bootstrap_alert_type(type)
    case type
    when :alert, "alert"
      "error"
    when :error, "error"
      "error"
    when :notice, "notice"
      "warning"
    when :success, "success"
      "success"
    else
      type.to_s
    end
  end
end
