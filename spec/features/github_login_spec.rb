require 'rails_helper'

feature "User can log in with GitHub" do
  context "with their existing user id" do

    before do
      Capybara.app = GithubAPI::Application
      stub_oauth
    end

    def stub_oauth
      OmniAuth.config.test_mode = true

      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
        provider: 'github',
        uid: '1234',
        info: {
          username: 'markyv18'
        },
        credentials: {
          token: 'pizza'
        }
      )
    end

    scenario 'The user clicks login on root path' do
      visit '/'

      expect(page.status_code).to eq(200)

      click_link "Click here to sign in with GitHub"

      expect(current_path).to eq(root_path)
      expect(page.body).to have_content("Howdy markyv18, your login is a success")
      expect(page.body).to have_link("Logout")
    end
  end
end
