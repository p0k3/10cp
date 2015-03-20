module VotesHelper

  def link_to_good_advice(user_id, advice, &block)
    if advice.has_already_vote(user_id, request.remote_ip)
      html_options = {class: "btn btn-default good disabled", id: "vote-true-#{advice.id}"}
      content_tag(:a, "javascript:", html_options, &block)
    else
      html_options = {class: "btn btn-default good", id: "vote-true-#{advice.id}"}
      content_tag(:a, "javascript:", html_options, &block)
    end
  end

  def link_to_bad_advice(user_id, advice, &block)
    if advice.has_already_vote(user_id, request.remote_ip)
      html_options = {class: "btn btn-default bad disabled", id: "vote-false-#{advice.id}"}
      content_tag(:a, "javascript:", html_options, &block)
    else
      html_options = {class: "btn btn-default bad", id: "vote-false-#{advice.id}"}
      content_tag(:a, "javascript:", html_options, &block)
    end
  end
end
