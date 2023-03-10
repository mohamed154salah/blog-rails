class SessionsController<ApplicationController
  
  def new
    
  end

  def create
    user = User.find_by(userName: params[:userName])
    if user.present? && user.authenticate(params[:password])
      puts "User is present and authenticated"
      session[:user_id] = user.id
      redirect_to root_path, notice: "You have successfully logged in"
    else
      puts "User is not present or not authenticated"
      flash[:alert] = "Invalid username or password"
      render :new
    end  
  end

  def destroy
    session[:user_id]=nil
    redirect_to root_path, notice: "You have successfully logged out"
  end
end