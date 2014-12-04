require 'rails_helper'

RSpec.describe Post, :type => :model do
  describe "Post.create" do
    let(:admin) { User.create( # creates a functional variable 'user'
      user_name: "kristen",
      email: "k@m.com",
      password: "hello",
      password_confirmation: "hello",
      admin: true
    )}

    it "is valid" do
      post = Post.create(
        title: "Foo",
        content: "Bar",
        user_id: admin.id
      )
      expect(post.valid?).to eq true
    end

    it "is invalid without title" do
      post = Post.create(
        content: "Bar",
        user_id: admin.id
      )
      expect(post.valid?).to eq false
    end

    it "is invalid without content" do
      post = Post.create(
        title: "Foo",
        user_id: admin.id
      )
      expect(post.valid?).to eq false
    end

    it "is invalid without user_id" do
      post = Post.create(
        title: "Foo",
        content: "Bar",
      )
      expect(post.valid?).to eq false
    end

  end
end
