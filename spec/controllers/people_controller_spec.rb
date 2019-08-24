require 'rails_helper'

RSpec.describe PeopleController, type: :controller do
  describe "#index" do
    it "returns a 200 response" do
      get :index
      expect(response).to have_http_status "200"
    end
  end

  describe "#show" do
    let(:person) {FactoryBot.create(:person)}
    before {get :show, params: {id: person}}

    it "returns a 200 response" do
      expect(response).to have_http_status "200"
    end

    it 'should render show view' do
      expect(response).to render_template :show
    end
  end

  describe "#create" do
    it "returns a 302 response" do
      person_params = FactoryBot.attributes_for(:person)
      post :create, params: {person: person_params}
      expect(response).to have_http_status "302"
    end
  end

  describe "#update" do
    before do
      @person = FactoryBot.create(:person)
    end

    it "updates a person" do
      person_params = FactoryBot.attributes_for(:person, first_name: 'Яна')
      patch :update, params: {id: @person.id, person: person_params}
      expect(@person.reload.first_name).to eq "Яна"
    end

    it "does not updat the person" do
      person_params = FactoryBot.attributes_for(:person)
      patch :update, params: {id: @person.id, person: person_params}
      expect(@person.reload.first_name).to eq "Ольга"
    end

    it "redirects to the show page" do
      person_params = FactoryBot.attributes_for(:person)
      patch :update, params: {id: @person.id, person: person_params}
      expect(response).to redirect_to action: :show, id: assigns(:person).id
    end

    it "returns a 302 response" do
      person_params = FactoryBot.attributes_for(:person)
      patch :update, params: {id: @person.id, person: person_params}
      expect(response).to have_http_status "302"
    end
  end

  describe "#destroy" do
    before do
      @person = FactoryBot.create(:person)
    end

    it "deletes a person" do
      expect {delete :destroy, params: {id: @person.id}}.to change(Person, :count).by(-1)
    end

    it "redirects to the dashboard" do
      delete :destroy, params: {id: @person.id}
      expect(response).to redirect_to("/people")
    end

    it "returns a 302 response" do
      delete :destroy, params: { id: @person.id }
      expect(response).to have_http_status "302"
    end
  end
end
