module Cms
  module WidgetsHelper
    def path_for_widget(page, widget)
      widget.new_record? ? page_widgets_path(page) : page_widget_path(page, widget)
    end
    
  end
end