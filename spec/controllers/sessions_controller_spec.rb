require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

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

  describe "POST #destroy" do

    let(:user) { User.create(
      user_name: "Kristina",
      email: "k@h.com",
      admin: false,
      password: "foo",
      password_confirmation: "foo"
      )
    }

    it "clears session" do
      post :destroy, nil, user_id: user.id
      expect(session[:user_id]).to eq nil
    end

    it "redirects to root_path" do
      post :destroy, nil, user_id: user.id
      expect(response).to redirect_to(root_path)
    end
  end

end
