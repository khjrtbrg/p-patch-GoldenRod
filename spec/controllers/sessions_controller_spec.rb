require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  describe "GET #destroy" do

    let(:user) { User.create(
      user_name: "Kristina",
      email: "k@h.com",
      admin: false,
      password: "foo",
      password_confirmation: "foo"
      )
    }

    it "clears session" do
      get :destroy, nil, user_id: user.id
      expect(session[:user_id]).to eq nil
    end

    it "redirects to root_path" do
      get :destroy, nil, user_id: user.id
      expect(response).to redirect_to(root_path)
    end
  end

end
