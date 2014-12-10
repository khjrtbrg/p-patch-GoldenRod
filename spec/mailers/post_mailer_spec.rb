require "rails_helper"

RSpec.describe PostMailer, :type => :mailer do

  describe "#new_post_alert" do
    let!(:post) { create(:post) }
    let!(:user) { create(:user) }

    before(:each) do
      PostMailer.new_post_alert(user, post).deliver
    end

    it "successfully sends" do
      expect(ActionMailer::Base.deliveries.count).to eq 1
    end

    it "sends to correct user" do
      expect(ActionMailer::Base.deliveries.last.to).to eq [user.email]
    end

    it "sends from the correct user" do
      expect(ActionMailer::Base.deliveries.last.from).to eq [ENV["MAIL_USERNAME"]]
    end

    it "sends with correct subject line" do
      expect(ActionMailer::Base.deliveries.last.subject).to eq "News @ Tendril: #{post.title}"
    end
  end
end
