require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context "Create" do
    it 'successfully' do
      user = FactoryBot.create(:user)
      users = User.all

      expect(user.valid?).to be_truthy
      expect(users.count).to eq(1)    
    end
  end
end
