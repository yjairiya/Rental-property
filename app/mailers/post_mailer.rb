class PostMailer < ApplicationMailer
  
  def contact_request_email
    @post = params[:post]
    @user = params[:user]

    mail from:  @user.email , to: @post.email, subject: "You got a new Property request!"
  end

  def response_to_user_email
    @post = params[:post]
    @user = params[:user]

    mail from:  @post.email , to: @user.email, subject: "You got a Response from Owner!"
    # mail to: @post.user.email , subject: "You got a new Property request!"
  end
end
