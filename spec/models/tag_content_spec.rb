require 'rails_helper'

RSpec.describe TagContent, type: :model do
  context "Create" do
    it 'successfully' do
      user = FactoryBot.create(:user)

      tag = user.tags.new(name: 'Ruby')
      content = user.contents.new(title: 'Titulo de teste', description: 'descricao de teste')

      TagContent.new(tag: tag, content: content)

      expect(tag.valid?).to be_truthy
    end

    it 'failure - content must exist' do
      user = FactoryBot.create(:user)

      tag = user.tags.new(name: 'Ruby')

      tag_content = tag.tag_contents.new

      expect(tag_content.valid?).to be_falsy
      expect(tag_content.errors.count).to be_equal(1)

      expect(tag_content.errors.full_messages.first).to be_include('Content must exist')  
    end

    it 'failure - tag must exist' do
      user = FactoryBot.create(:user)

      content = user.contents.new(title: 'Titulo de teste', description: 'descricao de teste')

      tag_content = content.tag_contents.new

      expect(tag_content.valid?).to be_falsy
      expect(tag_content.errors.count).to be_equal(1)
      expect(tag_content.errors.full_messages.first).to be_include('Tag must exist')  
    end
  end
end
