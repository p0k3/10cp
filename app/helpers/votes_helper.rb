module VotesHelper

  def link_to_good_advice(user_id, advice)
    if advice.has_already_vote(user_id, request.remote_ip)
      link_to "C'est voté (#{advice.upvotes})", "javascript:", class: "btn btn-default good disabled", id: "vote-true-#{advice.id}"
    else
      link_to "Très bon conseil (#{advice.upvotes})", "javascript:", onclick: "vote(#{advice.id}, true)", class: "btn btn-default good", id: "vote-true-#{advice.id}"
    end
  end

  def link_to_bad_advice(user_id, advice)
    if advice.has_already_vote(user_id, request.remote_ip)
      link_to "C'est voté (#{advice.downvotes})", "javascript:", class: "btn btn-default bad disabled", id: "vote-false-#{advice.id}"
    else
      link_to "Mauvais conseil (#{advice.downvotes})", "javascript:", onclick: "vote(#{advice.id}, false)", class: "btn btn-default bad", id: "vote-false-#{advice.id}"
    end
  end
end
