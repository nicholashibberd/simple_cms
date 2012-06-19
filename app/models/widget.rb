class Widget
  include Mongoid::Document
  field :position, :type => Integer, :default => 1000
  field :region
  
  default_scope asc(:position)
  
  belongs_to :page
  
  scope :by_region, lambda {|region| where(:region => region)}
  
  def widget_type
    self._type.underscore
  end
  
  def update_widget(params)
    self.update_attributes(params['text_widget'])
  end

end
