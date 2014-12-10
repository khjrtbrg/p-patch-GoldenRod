require "rails_helper"

RSpec.describe PostMailer, :type => :mailer do

  describe "#new_post_alert" do
    let!(:post) { create(:post) }
    let!(:user) { create(:user) }

    before(:each) do
      ActionMailer::Base.delivery_method = :test
      ActionMailer::Base.perform_deliveries = true
      ActionMailer::Base.deliveries = []
      PostMailer.new_post_alert(user, post).deliver
    end

    after(:each) do
      ActionMailer::Base.deliveries.clear
    end

    it "successfully sends" do
      expect(ActionMailer::Base.deliveries.count).to eq 1
    end
  end
end
