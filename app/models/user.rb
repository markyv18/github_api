class User < ApplicationRecord

  attr_reader :uid

    def initialize(attrs = {})
      @attrs = attrs
      @uid = attrs[:uid]
    end

    def name
      "#{attrs[:first_name]} #{attrs[:last_name]}"
    end

    
  def self.find_by(token = {})
    GithubService.find_by(token).map |raw_user|
      new(raw_user)
    end

  def self.from_omniauth(auth_info)
    # require "pry"; binding.pry
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.screen_name        = auth_info.info.nickname
      new_user.oauth_token        = auth_info.credentials.token
      new_user.oauth_token_secret = auth_info.credentials.secret

    end
  end

end
