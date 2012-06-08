module Cms
  class NavItemsController < Cms::AdminController

    def new
      @nav_menu = NavMenu.find(params[:nav_menu_id])
      @nav_item = @nav_menu.nav_items.new
    end

    def edit
      @nav_menu = NavMenu.find(params[:nav_menu_id])
      @nav_item = NavItem.find(params[:id])
    end
  
    def index
      @nav_menu = NavMenu.find(params[:nav_menu_id])    
    end

    def create
      nav_menu = NavMenu.find(params[:nav_menu_id])
      nav_item = nav_menu.nav_items.new(params[:nav_item])
      if nav_item.save
        redirect_to nav_menu_nav_items_path(nav_menu)
      else
        flash[:error] = "Nav Item could not be created"
        render :action => "new"
      end
    end

    def update
      nav_item = NavItem.find(params[:id])
      if nav_item.update_attributes(params[:nav_item])
        redirect_to nav_menu_nav_items_path(nav_item.nav_menu)
      else
        flash[:error] = "Nav Item could not be updated"      
        render :action => "edit"
      end
    end

    def destroy
      nav_item = NavItem.find(params[:id])
      nav_menu = nav_item.nav_menu
      nav_item.destroy
      redirect_to nav_menu_nav_items_path(nav_menu)
    end
  end
end
