module Cms
  class AdminController < ApplicationController
    include SessionsHelper
    protect_from_forgery
  
    before_filter :login_required
  
    def login_required
      if signed_in?
        return true
      end
      flash[:error] = 'Please login to continue'
      redirect_to signin_path
    end
  end
end