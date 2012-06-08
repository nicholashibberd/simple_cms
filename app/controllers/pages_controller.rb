class PagesController < ApplicationController
  def home
    @page = Site.instance.homepage
    render 'show'
  end
  
  def show
    @page = Page.find_by_slug(params[:id])
  end
  
end