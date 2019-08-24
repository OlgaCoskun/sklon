require 'rails_helper'

RSpec.describe PeopleController, type: :controller do
  describe "#index" do
    # it 'responds successfully' do
    #   # этот тест падает, не понятно почему
    #   # нагуглила тут похожую проблему https://github.com/rails/rails/issues/35417
    #   # обновила rspec, не помогло
    #   get :index
    #   expect(response).to be_success
    # end

    it "returns a 200 response" do
      get :index
      expect(response).to have_http_status "200"
    end
  end

  describe "#show" do
    before do
      @person = FactoryBot.create(:person)
    end
    it "responds successfully" do
      get :show, params: { id: @person.id }
      expect(response).to be_success
    end
  end
end
