class PostMailer < ActionMailer::Base
  default from: "PeaPlanner@garden.com"

  def post_update( post_id)

    @post = Post.find(post_id)

    mail(
      to: user_emails,
      subject: "#{@post.user.name} just wrote a new post!"

      # to: @user.email,
      # subject: "#{@post.user.name} just wrote a new post!"
     )
  end

  def admin_request(user_id)
    @user = User.find(user_id)
    mail(
    to: "stephmpi@gmail.com",
    subject: "#{@user.name} wants Admin Access"

    # to: @user.email,
    # subject: "#{@post.user.name} just wrote a new post!"
    )
  end

  private

  def user_emails
    User.all.collect do |user|
      user.email
    end

  end



end
