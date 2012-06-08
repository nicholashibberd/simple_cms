module Cms
  module NavMenusHelper
  
    def main_navigation
      NavMenu.main_nav || NavMenu.first
    end
            
  end
end