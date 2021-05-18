require 'rails_helper'

RSpec.describe Content, type: :model do
  context "Create" do
    it 'successfully' do
      user = FactoryBot.create(:user)

      content = user.contents.new(title: 'Titulo de teste', description: 'descricao de teste')
      expect(content.valid?).to be_truthy
    end

    it 'failure - title can\'t be blank' do
      user = FactoryBot.create(:user)

      content = user.contents.new(title: '', description: 'descricao sem titulo')

      expect(content.valid?).to be_falsy
    end

    it 'failure - description can\'t be blank' do
      user = FactoryBot.create(:user)

      content = user.contents.new(title: 'titulo sem descricao', description: '')

      expect(content.valid?).to be_falsy
    end
  end
end
