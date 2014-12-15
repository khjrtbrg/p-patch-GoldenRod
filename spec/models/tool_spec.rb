require 'rails_helper'

RSpec.describe Tool, :type => :model do

  let!(:tool) { create(:tool) }

  describe ".create" do
    it "is valid" do
      expect(tool.valid?).to eq true
    end

    it "is invalid without name" do
      invalid_tool = build(:tool, name: "")
      expect(invalid_tool.invalid?).to eq true
    end

    it "is invalid without image_url" do
      invalid_tool = build(:tool, image_url: "")
      expect(invalid_tool.invalid?).to eq true
    end

    it "is invalid if image_url is not web address" do
      invalid_tool = build(:tool, image_url: "foo")
      expect(invalid_tool.invalid?).to eq true
    end

    # it "is invalid if image_url is not valid web address" do
    #   tool = build(:tool, image_url: "http://tools.com/tool.jpg")
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
