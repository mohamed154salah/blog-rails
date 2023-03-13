class PasswordResetsController<ApplicationController

  def new
  end
  
  def create
    user = User.find_by(userName:params[:userName])
    if user.present?
      PasswordMailer.with(email: params[:Email],user: user).reset.deliver_now
      redirect_to root_url, :notice => "Email sent with password reset instructions."      
    else
      redirect_to root_url, :notice => "userName not found."      

      
    end
  end
  
  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_path, alert: "Your token has expired. Please try again"
  end
  
  def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(user_params)
      redirect_to sign_in_path, :notice => "Password has been reset!"
    else
      render :edit
    end
  end
  private
  
  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
    
end