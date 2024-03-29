class RegistrationController<ApplicationController

  def new
    @user = User.new
  end  
  
  def create
    @user=User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "You have successfully signed up"
    else
      render :new 
    end  
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:userName,:password,:email,:password_confirmation)
  end
end