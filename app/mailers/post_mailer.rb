class PostMailer < ApplicationMailer
  
  def contact_request_email
    @post = params[:post]
    @user = params[:user]

    mail from:  @user.email , to: @post.email  


    # mail to: @post.email , subject: "You got a new Property request!"
    # mail to: @post.user.email , subject: "You got a new Property request!"
  end

  def response_to_user_email
    @post = params[:post]

    mail to: "parth@yopmail.com" , subject: "You got a new Property request!"
    # mail to: @post.user.email , subject: "You got a new Property request!"
  end
end
