class Region
  include Mongoid::Document
  default_scope asc(:position)
  
  field :name
  
  belongs_to :page
  has_many :widgets
  
  def add_widget(params)
    widget_type = params[:widget_type]
    widget_class = widget_type.classify.constantize
    widgets << widget_class.new(params[widget_type])
  end
          
end