require 'rails_helper.rb'

RSpec.describe "User visit" do
  context "Homepage" do
    it 'successfully - already logged in' do
      user = FactoryBot.create(:user)
      login_as user, scope: :user

      visit root_path

      expect(page.html.downcase).to have_content(user.email)  
    end
  end
end
