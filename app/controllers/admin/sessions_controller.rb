class Admin::SessionsController < Admin::ApplicationController
  layout 'admin/login'
  
  def new
  end

    #def create
  #	user = User.where(:email => params[:session][:email].downcase).first
  	
  # if user && user.authenticate(params[:session][:password])
  #		session[:user_id] = user.id
  #		redirect_to admin_posts_path, :notice => "Logged In"
  #	else
  	#	flash.now.alert = "Invalid email or password"
  	#	render 'new'
  	#end
  #end

  def create
    
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to admin_posts_path, :notice => "Logged In"
    else
      flash.now.alert = "Invalid email or password"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to admin_login_path, :notice => "logged Out"
  end
end
