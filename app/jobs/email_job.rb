class EmailJob
  @queue = :email

  def self.perform(post_id)

    PostMailer.post_update(post_id).deliver

  end

end
