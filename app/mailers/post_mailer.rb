class PostMailer < ActionMailer::Base
  default from: ENV["MAIL_USERNAME"]

  def new_post_alert(user, post)
    @user    = user # this scopes to the mailer view
    @post_id = post.id
    mail(to: @user.email, subject: "News @ Tendril: #{post.title}" )
  end
end
