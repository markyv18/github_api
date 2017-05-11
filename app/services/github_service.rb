class GithubService

  def self.users_by(token)
    response = Faraday.get("http://api.github.com/user?access_token=#{token}")
    JSON.parse(response.body) #, symbolize_names: true)[:results]
  end

end
