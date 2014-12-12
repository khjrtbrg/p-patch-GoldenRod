require "rails_helper"

RSpec.describe PostMailer, :type => :mailer do

  describe "#new_post_alert" do
    let!(:post) { create(:post) }
    let!(:user) { create(:user) }
    let!(:mailer) { PostMailer.new_post_alert(user, post) }

    it "includes the correct recipient" do
      expect(mailer.bcc).to include user.email
    end

    it "includes the correct sender" do
      expect(mailer.from).to include ENV["MAIL_USERNAME"]
    end

    it "has the correct subject line" do
      expect(mailer.subject).to eq "News @ Tendril: #{post.title}"
    end
  end
end
