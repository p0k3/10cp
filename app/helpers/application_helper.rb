module ApplicationHelper
  def body_class
    controller_name + " " + action_name
  end

  def custom_bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      puts type.inspect
      type = :success if type == "notice"
      type = :error   if type == "alert"
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

  def master_menu_is_active(master)
    params[:controller] == "themes" && params[:id].to_i == master.id
  end

  def header_style(color)
    "background: #ffffff;background: -moz-linear-gradient(top,  #ffffff 0%, #ffffff 25%, #{color} 25%, #{color} 100%); background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#ffffff), color-stop(25%,#ffffff), color-stop(25%,#{color}), color-stop(100%,#{color})); background: -webkit-linear-gradient(top,  #ffffff 0%,#ffffff 25%,#{color} 25%,#{color} 100%); background: -o-linear-gradient(top,  #ffffff 0%,#ffffff 25%,#{color} 25%,#{color} 100%); background: -ms-linear-gradient(top,  #ffffff 0%,#ffffff 25%,#{color} 25%,#{color} 100%);"
  end


end
