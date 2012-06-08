module Cms
  class PagesController < Cms::AdminController

    def new
      @page = Page.new
    end

    def edit
      @page = Page.find_by_slug(params[:id])
    end

    def show 
      @page = Page.find_by_slug(params[:id])
    end

    def index
      @pages = Page.all
    end

    def create
      page = Page.new(params[:page])
      if page.save
    		redirect_to edit_page_path(page), :notice => 'Page successfully created'
      else
        flash[:error] = "There was an error creating the page"
        render :action => 'new'
      end  		
    end

  	def	update
  		page = Page.find_by_slug(params[:id])
      page.update_page(params[:page])
  		redirect_to pages_path
  	end

  	def	destroy
  		page = Page.find_by_slug(params[:id])
  		page.destroy
      flash[:error] = "Page successfully deleted"  		
  		redirect_to pages_path
  	end    
  end
end
