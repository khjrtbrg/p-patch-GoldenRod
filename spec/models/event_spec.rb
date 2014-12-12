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

  #  Event(id: integer,  description: text,
  #  location: string, date: date, start_time: time,
  #  end_time: time, user_id: integer, created_at: datetime,
  #  updated_at: datetime)

  end
end
