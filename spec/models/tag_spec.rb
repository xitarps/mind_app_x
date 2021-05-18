require 'rails_helper'

RSpec.describe Tag, type: :model do
  context "Create" do
    it 'successfully' do
      user = FactoryBot.create(:user)

      tag = user.tags.new(name: 'Ruby')
      expect(tag.valid?).to be_truthy
    end

    it 'failure - duplicated' do
      user = FactoryBot.create(:user)

      user.tags.create(name: 'Ruby')
      other_tag = Tag.last.dup

      expect(other_tag.valid?).to be_falsy
    end

    it 'failure - duplicated(case insensitive)' do
      user = FactoryBot.create(:user)

      user.tags.create(name: 'Ruby')
      other_tag = Tag.last.dup

      expect(other_tag.valid?).to be_falsy
    end

    it 'failure - name can\'t be blank' do
      user = FactoryBot.create(:user)

      tag = user.tags.new(name: '')

      expect(tag.valid?).to be_falsy
    end

    it 'failure - name can\'t be nil' do
      user = FactoryBot.create(:user)

      tag = user.tags.new(name: nil)

      expect(tag.valid?).to be_falsy
    end
  end
end
