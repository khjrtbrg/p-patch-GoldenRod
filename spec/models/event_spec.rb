require 'rails_helper'

RSpec.describe Event, :type => :model do

  let!(:event) { create(:event) }

  describe ".create" do
    it "is valid" do
      expect(event.valid?).to eq true
    end

    it "is invalid without title" do
      invalid_event = build(:event, title: "") # this will fail w/ create
      expect(invalid_event.invalid?).to eq true
    end

    it "is invalid without date" do
      invalid_event = build(:event, date: "") # this will fail w/ create
      expect(invalid_event.invalid?).to eq true
    end

    it "is invalid with improperly formatted date" do
      invalid_event = build(:event, date: "fish") # this will fail w/ create
      expect(invalid_event.invalid?).to eq true
    end

    it "is invalid without user_id" do
      invalid_event = build(:event, user_id: "") # this will fail w/ create
      expect(invalid_event.invalid?).to eq true
    end
  end
end
