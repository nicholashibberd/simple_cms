module Cms
  class WidgetsController < Cms::AdminController

    def index
      @widgets = Widget.all
    end

    def show
      @widget = Widget.find(params[:id])
    end

    def new
      @page = Page.find_by_slug(params[:page_id])   
      @widget_class = params[:widget_type].classify.constantize
      @widget = @widget_class.new
    end

    def edit
      @page = Page.find_by_slug(params[:page_id])
      @widget = Widget.find(params[:id])
    end

    def create
      page = Page.find_by_slug(params[:page_id])
      page.add_widget(params)
      redirect_to edit_page_path(page)
    end

    def update
      page = Page.find_by_slug(params[:page_id])
      widget = Widget.find(params[:id])
      widget.update_widget(params)
      redirect_to edit_page_path(page)
    end

    def destroy
      widget = Widget.find(params[:id])
      page = Page.find_by_slug(params[:page_id])
      widget.destroy
      redirect_to edit_page_path(page)
    end
          
  end
end