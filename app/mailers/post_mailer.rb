class PostMailer < ApplicationMailer
  def new_post_email
    @post = params[:post]

    mail to: "parth@yopmail.com" , subject: "You got a new Property request!"
    # mail to: @post.user.email , subject: "You got a new Property request!"
  end
end
