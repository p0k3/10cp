module ApplicationHelper
  def body_class
    controller_name + " " + action_name
  end

  def custom_bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      type = :success if type == :notice
      type = :error   if type == :alert
      text = "<script>toastr.#{type}('#{message}');</script>"
      flash_messages << text.html_safe if message
    end
    flash_messages.join("\n").html_safe
  end

  def canonical_url
    raw "#{host}#{path_without_html_extension}"
  end

  def path_without_html_extension
    request.path[1..request.path.length].sub(/\.html$/, '')
  end

  def host
    root_url
  end
end
