require 'rails_helper.rb'

RSpec.describe "User visit" do
  context "Homepage" do
    it 'successfully - login page' do
      visit root_path

      expect(page.html.downcase).to have_content('you need to sign in or sign up before continuing')  
    end
  end
end
