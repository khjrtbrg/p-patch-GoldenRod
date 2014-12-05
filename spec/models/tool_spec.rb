require 'rails_helper'

RSpec.describe Tool, :type => :model do

  describe "Tool.create" do
    let(:admin) { User.create( # creates a functional variable 'user'
      user_name: "kristen",
      email: "k@m.com",
      password: "hello",
      password_confirmation: "hello",
      admin: true
    )}

    # it "is valid" do
    #   tool = Tool.create(
    #     name: "Shovel",
    #     image_url: "http://www.homedepot.com/catalog/productImages/300/07/078a19f9-63ca-469b-bc27-6982bd6a4ce6_300.jpg",
    #     user_id: admin.id
    #   )
    #   expect(tool.valid?).to eq true
    # end
    #
    # it "is invalid without name" do
    #   tool = Tool.create(
    #     image_url: "http://www.homedepot.com/catalog/productImages/300/07/078a19f9-63ca-469b-bc27-6982bd6a4ce6_300.jpg",
    #     user_id: admin.id
    #   )
    #   expect(tool.valid?).to eq false
    # end
    #
    # it "is invalid without image_url" do
    #   tool = Tool.create(
    #     name: "Shovel",
    #     user_id: admin.id
    #   )
    #   expect(tool.valid?).to eq false
    # end
    #
    # it "is invalid without user_id" do
    #   tool = Tool.create(
    #     name: "Shovel",
    #     image_url: "http://www.homedepot.com/catalog/productImages/300/07/078a19f9-63ca-469b-bc27-6982bd6a4ce6_300.jpg",
    #   )
    #   expect(tool.valid?).to eq false
    # end
    #
    # it "is invalid if image_url is not web address" do
    #   tool = Tool.create(
    #     name: "Shovel",
    #     user_id: admin.id,
    #     image_url: "foo"
    #   )
    #   expect(tool.valid?).to eq false
    # end

    it "is invalid if image_url is not valid web address" do
      tool = Tool.create(
        name: "Shovel",
        user_id: admin.id,
        image_url: "http://tools.com/tool.jpg"
      )
      expect(tool.valid?).to eq false
    end
  end
end
