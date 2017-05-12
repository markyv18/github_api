require 'rails_helper'

describe GithubUser do
  context ".find github user" do
    it " that matches token" do
      VCR.use_cassette("github_user") do

        token = ENV["github_user_token"]

        github_user = GithubUser.find_by(token)
        expect(github_user.login).to eq("markyv18")
        expect(github_user.name).to eq("Mark Van Akkeren ")
        expect(github_user.location).to eq("Boulder, CO ")
        expect(github_user.attrs)
      end
    end
  end
end
