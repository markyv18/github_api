class GithubUser

  attr_accessor :login, :name, :location, :attrs

  def initialize(attrs = {})

    @attrs      = attrs
    @name       = attrs[:name]
    @login      = attrs[:login]
    @location   = attrs[:location]
  end

  def self.find_by(token)
    new(GithubService.find_user(token))
  end
end
