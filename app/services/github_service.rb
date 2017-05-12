class GithubService
  def self.find_user(token)
    response = Faraday.get("https://api.github.com/user?access_token=#{token}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.followers(token)
    response = Faraday.get("https://api.github.com/user/followers?access_token=#{token}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
