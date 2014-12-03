require 'rails_helper'

describe User, :type => :model do

  describe "User.create" do
    it "is valid" do
      user = User.create(
        user_name: "Kristina",
        email: "k@h.com",
        admin: false,
        password: "foo",
        password_confirmation: "foo"
      )
      expect(user.valid?).to eq true
    end

    it "is invalid without username" do
      user = User.create(
        email: "k@h.com",
        admin: false
      )
      expect(user.valid?).to eq false
    end

    it "is invalid with username < 7 characters" do
      user = User.create(
        user_name: "K",
        email: "k@h.com",
        admin: false,
        password: "foo",
        password_confirmation: "foo"
      )
      expect(user.valid?).to eq false
    end

    it "is invalid without email" do
      user = User.create(
        user_name: "Kristina",
        admin: false,
        password: "foo",
        password_confirmation: "foo"
      )
      expect(user.valid?).to eq false
    end

    it "is invalid without email format" do
      user = User.create(
        user_name: "Kristina",
        email: "k",
        admin: false,
        password: "foo",
        password_confirmation: "foo"
      )
      expect(user.valid?).to eq false
    end

    it "is invalid without password" do
      user = User.create(
        user_name: "Kristina",
        email: "k@h.com",
        admin: false
      )
      expect(user.valid?).to eq false
    end

    # it "is invalid without password confirmation" do
    #
    # end

    # it "is invalid without matching password confirmation" do
    #
    # end

    #validate email and username unique

  end

end
