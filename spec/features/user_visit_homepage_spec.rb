require 'rails_helper.rb'

RSpec.describe "User visit" do
  context "homepage" do
    it 'successfully' do
      visit root_path

      expect(page.html.downcase).to have_content('ola')  
    end
  end
end
