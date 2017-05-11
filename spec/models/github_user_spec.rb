require 'rails_helper'

describe GithubUser do

  attr_reader :token

  before do
    @token = ENV['GITHUB_TOKEN']
  end

  context ".find_github_user(token)" do
    it "finds a dang user that matches the token. So cool." do
      VCR.use_cassette("finds_user") do
        githubuser = GithubUser.find_github_user(token)

        expect(githubuser.login).to eq("NessEFC")
        expect(githubuser.name).to eq("Craig Ness")
        expect(githubuser.avatar_url).to eq("https://avatars2.githubusercontent.com/u/22826692?v=3")
        expect(githubuser.starred_url).to eq("https://api.github.com/users/NessEFC/starred{/owner}{/repo}")
        expect(githubuser.followers_url).to eq("https://api.github.com/users/NessEFC/followers")
        expect(githubuser.following_url).to eq("https://api.github.com/users/NessEFC/following{/other_user}")
      end
    end
  end

  context ".starred(token)" do
    it "finds the starred repos for a user" do
      VCR.use_cassette("starred_repos") do
        githubuser = GithubUser.find_github_user(token)
        starred = githubuser.starred(token)

        expect(starred).to be_an(Array)
        expect(starred.count).to eq(2)
        expect(starred.first[:name]).to eq("mix_master")
      end
    end
  end

  context ".followers(token)" do
    it "finds the followers of a user" do
      VCR.use_cassette("followers") do
        githubuser = GithubUser.find_github_user(token)
        followers = githubuser.followers(token)

        expect(followers).to be_an(Array)
        expect(followers.count).to eq(2)
        expect(followers[0].login).to eq("BethKnight1234")
        expect(followers[1].login).to eq("VictoriaVasys")
      end
    end
  end

  context ".following(token)" do
    it "finds who the user is following" do
      VCR.use_cassette("following") do
        githubuser = GithubUser.find_github_user(token)
        following = githubuser.following(token)

        expect(following).to be_an(Array)
        expect(following.count).to eq(2)
        expect(following[0].login).to eq("samlandfried")
        expect(following[1].login).to eq("lukyans")
      end
    end
  end
end
