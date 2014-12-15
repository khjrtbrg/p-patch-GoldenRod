require 'rails_helper'

RSpec.describe Event, :type => :model do

  let!(:event) { create(:event) }

  describe ".create" do
    it "is valid" do
      expect(event.valid?).to eq true
    end

    context "is invalid" do
      it "without title" do
        invalid_event = build(:event, title: "") # this will fail w/ create
        expect(invalid_event.invalid?).to eq true
      end

      it "without date" do
        invalid_event = build(:event, date: "")
        expect(invalid_event.invalid?).to eq true
      end

      it "with improperly formatted date" do
        invalid_event = build(:event, date: "fish")
        expect(invalid_event.invalid?).to eq true
      end

      it "without user_id" do
        invalid_event = build(:event, user_id: "")
        expect(invalid_event.invalid?).to eq true
      end
    end
  end
end
