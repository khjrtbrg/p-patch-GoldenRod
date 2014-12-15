require 'rails_helper'

describe User, :type => :model do

  let!(:user) { create(:user) }

  describe "User.create" do
    it "is valid" do
      expect(user.valid?).to eq true
    end

    it "is invalid without username" do
      invalid_user = build(:user, user_name: "")
      expect(invalid_user.invalid?).to eq true
    end

    it "is invalid with username < 7 characters" do
      invalid_user = build(:user, user_name: "K")
      expect(invalid_user.invalid?).to eq true
    end

    it "is invalid without email" do
      invalid_user = build(:user, email: "")
      expect(invalid_user.invalid?).to eq true
    end

    it "is invalid without email format" do
      invalid_user = build(:user, email: "kristen")
      expect(invalid_user.invalid?).to eq true
    end

    it "is invalid without password" do
      invalid_user = build(:user, password: "")
      expect(invalid_user.invalid?).to eq true
    end

    it "is invalid without password confirmation" do
      invalid_user = build(:user, password_confirmation: "")
      expect(invalid_user.invalid?).to eq true
    end

    it "is invalid without matching password confirmation" do
      invalid_user = build(
        :user,
        password: "foo",
        password_confirmation: "bar"
      )
      expect(invalid_user.invalid?).to eq true
    end

    it "is invalid without a unique username" do
      build(:user, user_name: "Kristina")
      invalid_user = build(:user, user_name: "Kristina")
      expect(invalid_user.invalid?).to eq true
    end

    it "is invalid without a unique email" do
      build(:user, email: "k@h.com")
      invalid_user = build(:user, email: "k@h.com")
      expect(invalid_user.invalid?).to eq true
    end
  end
end
