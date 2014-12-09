require 'rails_helper'

RSpec.describe Tool, :type => :model do

  describe ".create" do
    it "is valid" do
      tool = Tool.create(
        name: "Shovel",
        image_url: "http://www.homedepot.com/catalog/productImages/300/07/078a19f9-63ca-469b-bc27-6982bd6a4ce6_300.jpg"
      )
      expect(tool.valid?).to eq true
    end

    it "is invalid without name" do
      tool = Tool.create(
        image_url: "http://www.homedepot.com/catalog/productImages/300/07/078a19f9-63ca-469b-bc27-6982bd6a4ce6_300.jpg"
      )
      expect(tool.valid?).to eq false
    end

    it "is invalid without image_url" do
      tool = Tool.create(
        name: "Shovel"
      )
      expect(tool.valid?).to eq false
    end

    it "is invalid if image_url is not web address" do
      tool = Tool.create(
        name: "Shovel",
        image_url: "foo"
      )
      expect(tool.valid?).to eq false
    end

    # it "is invalid if image_url is not valid web address" do
    #   tool = Tool.create(
    #     name: "Shovel",
    #     image_url: "http://tools.com/tool.jpg"
    #   )
    #   expect(tool.valid?).to eq false
    # end
  end

  let(:tool) { create(:tool) }
  let(:borrowed_tool) { create(:borrowed_tool) }
  let(:user) { create(:user) }

  describe "#checked_out_by?" do
    context "tool checked out by user" do
      it "returns true" do
        borrowed_tool.update(user_id: user.id)
        expect(borrowed_tool.checked_out_by?(user)).to eq true
      end
    end

    context "tool not checked out by user" do
      it "returns false" do
        expect(borrowed_tool.checked_out_by?(user)).to eq false
      end
    end

    context "user is nil" do
      it "returns nil" do
        expect(borrowed_tool.checked_out_by?(nil)).to eq nil
      end
    end
  end

  describe "#unavailable?" do
    it "returns true if checked out" do
      expect(borrowed_tool.unavailable?).to eq true
    end

    it "returns false if not checked out" do
      expect(tool.unavailable?).to eq false 
    end
  end
end
