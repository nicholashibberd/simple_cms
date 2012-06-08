module Cms
  class SessionsController < Cms::AdminController
    include Cms::SessionsHelper
    skip_before_filter :login_required
    
    def method_name
      @session = Session.new
    end
  
    def create
      user = User.authenticate(params[:session][:email], params[:session][:password])
      if user.nil?
        flash[:error] = "Your email/password combination is invalid"
        redirect_to signin_path
      else
        sign_in user
        redirect_to admin_home_path
      end 
    end  
  
    def destroy
      sign_out
      redirect_to signin_path
    end

  end
end