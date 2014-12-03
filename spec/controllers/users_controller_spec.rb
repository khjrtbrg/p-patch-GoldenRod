require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET #new" do
    it "is successful" do
      get :new
      expect(response.status).to eq 200
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

end