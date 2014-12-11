class AdminEmailJob
  @queue = :email

  def self.perform(user_id)

    PostMailer.admin_request(user_id).deliver

  end

end
