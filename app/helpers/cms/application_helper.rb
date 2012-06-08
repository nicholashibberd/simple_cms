module Cms
  module ApplicationHelper
    def current_controller
      request[:controller].gsub('cms/', '')
    end
    
    def show_editing_tools?
      request[:action] == 'edit'
    end
        
  end
end
