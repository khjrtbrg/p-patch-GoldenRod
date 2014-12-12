require 'rails_helper'

RSpec.describe EventsController, :type => :controller do

  describe "GET #index" do
    it "is successful" do
       get :index
       expect(response.status).to eq 200
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

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

  describe "POST #create" do

    let!(:user) { create(:user) }
    let(:request) { post :create, { event: {
          title: "Best event ever",
          description: "Mango madness",
          location: "",
          date: "December 12, 2014",
          start_time: "",
          end_time: ""
        }
      }
    }

    context "if user" do
      before(:each) do
        session[:user_id] = user.id
      end

      it "is successful" do
        request
        expect(response).to redirect_to(events_path)
      end

      it "creates event" do
        expect { request }.to change(Event, :count).by(1)
      end
    #
    #   it "renders :new if validation fails" do
    #     post :create, { post: { title: nil, content: nil } }
    #     expect(response).to render_template(:new)
    #   end

    ###########
    # context "if guest" do
    #   it "is unsuccessful" do
    #     request
    #     expect(response).to redirect_to(posts_path)
    #   end
    #
    #   it "does not create post" do
    #     expect { request }.to change(Post, :count).by(0)
    #   end
    # end
    #

    end
  end
end
