module VotesHelper

  def link_to_good_advice(user_id, advice, data_type = 'json', &block)
    if advice.has_already_vote(user_id, request.remote_ip)
      html_options = {class: "btn btn-default good disabled", style:"background:#{advice.theme_color}", id: "vote-true-#{advice.id}"}
      content_tag(:a, "javascript:", html_options, &block)
    else
      html_options = {onclick: "javascript:vote(#{advice.id}, true, '#{data_type}')", class: "btn btn-default", style:"background:#{advice.theme_color}", id: "vote-true-#{advice.id}"}
      content_tag(:a, "javascript:", html_options, &block)
    end
  end

  def link_to_bad_advice(user_id, advice, data_type = 'json', &block)
    if advice.has_already_vote(user_id, request.remote_ip)
      html_options = {class: "btn btn-default bad disabled", style:"background:#{advice.theme_color}", id: "vote-false-#{advice.id}"}
      content_tag(:a, "javascript:", html_options, &block)
    else
      html_options = {onclick: "javascript:vote(#{advice.id}, false, '#{data_type}')", class: "btn btn-default", style:"background:#{advice.theme_color}", id: "vote-false-#{advice.id}"}
      content_tag(:a, "javascript:", html_options, &block)
    end
  end
end
