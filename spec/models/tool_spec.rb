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

    it "is valid" do
      tool = Tool.create(
        name: "Shovel",
        image_url: "http://www.tools.com/tools/shovel.jpg",
        user_id: admin.id
      )
      expect(tool.valid?).to eq true
    end

    it "is invalid without name" do
      tool = Tool.create(
        image_url: "http://www.tools.com/tools/shovel.jpg",
        user_id: admin.id
      )
      expect(tool.valid?).to eq false
    end

    it "is invalid without image_url" do
      tool = Tool.create(
        name: "Shovel",
        user_id: admin.id
      )
      expect(tool.valid?).to eq false
    end

    it "is invalid without user_id" do
      tool = Tool.create(
        name: "Shovel",
        image_url: "http://www.tools.com/tools/shovel.jpg",
      )
      expect(tool.valid?).to eq false
    end
  end
end
