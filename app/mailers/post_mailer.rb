class PostMailer < ActionMailer::Base
  default from: "PeaPlanner@garden.com"

  def post_update(user_id, post_id)
    @user= User.find(user_id)
    @post = Post.find(post_id)

    mail(
      # to: "stephmpi@gmail.com",
      # subject: "#{@post.user.name} just wrote a new post!"

      to: @user.email,
      subject: "#{@post.user.name} just wrote a new post!"
     )



  end




end
