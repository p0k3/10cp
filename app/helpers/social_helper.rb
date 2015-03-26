module SocialHelper

  def get_share_count(url)
    response = JSON.load(open("http://graph.facebook.com/?id=#{url}"))
    if response['shares']
      response['shares']
    else
      0
    end
  end

  def get_plus_one_count(url)
    api = "https://clients6.google.com/rpc?key=AIzaSyCKSbrvQasunBoV16zDH9R33D88CeLr9gQ"
    params = [{
        method: "pos.plusones.get",
        id: "p",
        params: {
            nolog: true,
            id: url,
            source: "widget",
            userId: "@viewer",
            groupId: "@self"
            },
        jsonrpc: "2.0",
        key: "p",
        apiVersion: "v1"
    }]

    response = HTTParty.post(api, body: params.to_json, headers: { 'Content-Type' => 'application/json' })
    response.first['result']['metadata']['globalCounts']['count'].to_i
  end

  def get_tweet_count(url)
    api = "http://urls.api.twitter.com/1/urls/count.json?url=#{url}"
    call = URI.encode(api)
    response = JSON.load(open(call))

    response['count']
  end
end