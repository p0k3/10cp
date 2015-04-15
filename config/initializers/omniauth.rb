DixConseilsPour::Application.config.middleware.use OmniAuth::Builder do
  provider :facebook, FACEBOOK_CONFIG['app_id'], FACEBOOK_CONFIG['secret'], {:scope => 'email, read_stream, read_friendlists, friends_likes, friends_status, offline_access'}
end