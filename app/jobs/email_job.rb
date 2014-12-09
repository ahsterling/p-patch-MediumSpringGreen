class EmailJob
  @queue = :email

  def self.perform(user_id, post_id)
    PostMailer.post_update(user_id, post_id).deliver
  end

end
