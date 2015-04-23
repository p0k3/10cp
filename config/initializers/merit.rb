# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongoid
  # config.orm = :active_record

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grand badge if no
  # `:to` option is given. Default is 'User'.
  # config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  # config.current_user_method = 'current_user'
end

# Create application badges (uses https://github.com/norman/ambry)
badge_id = 0

badges = [{
  id: (badge_id = badge_id+1),
  name: 'bronze_elector',
  description: "hundred_votes"
}, {
  id: (badge_id = badge_id+1),
  name: 'silver_elector',
  description: "five_hundred_votes"
}, {
  id: (badge_id = badge_id+1),
  name: 'gold_elector',
  description: "thousand_votes"
}, {
  id: (badge_id = badge_id+1),
  name: 'stone_advisor',
  description: "hundred_advices"
}, {
  id: (badge_id = badge_id+1),
  name: 'bronze_advisor',
  description: "two_hundred_advices"
}, {
  id: (badge_id = badge_id+1),
  name: 'silver_advisor',
  description: "five_hundred_advices"
}, {
  id: (badge_id = badge_id+1),
  name: 'gold_advisor',
  description: "thounsand_advices"
}, {
  id: (badge_id = badge_id+1),
  name: 'diamond_advisor',
  description: "mile_advices"
}]

badges.each do |attrs|
  Merit::Badge.create! attrs
end
