require 'rails_helper'

RSpec.describe Post, :type => :model do

  let!(:post) { create(:post) }

  describe ".create" do
    it "is valid" do
      expect(post.valid?).to eq true
    end

    context "is invalid" do
      it "without title" do
        invalid_post = build(:post, title: "")
        expect(invalid_post.invalid?).to eq true
      end

      it "without content" do
        invalid_post = build(:post, content: "")
        expect(invalid_post.invalid?).to eq true
      end

      it "without user_id" do
        invalid_post = build(:post, user_id: "")
        expect(invalid_post.invalid?).to eq true
      end
    end
  end
end
