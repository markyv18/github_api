require 'rails_helper'

feature "User can log in with GitHub" do
  context "with their existing user id" do

    before do
      Capybara.app = GithubApi::Application
      stub_oauth
    end

    def stub_oauth
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
        provider: 'github',
        uid: '1234',
        info: {
          nickname: 'markyv18'
        },
        credentials: {
          token: 'pizza'
        }
      )
    end

    scenario 'and when they click the login root path they are signed in' do
      VCR.use_cassette("github_user_login") do
      visit '/'
      expect(page.status_code).to eq(200)

      click_link "Click here to sign in with GitHub"

      expect(current_path).to eq(root_path)

      expect(page).to have_content("Hello, markyv18")
      expect(page.body).to have_link("Logout")
    end
    end
  end
end
