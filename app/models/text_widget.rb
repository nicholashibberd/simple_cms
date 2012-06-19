class TextWidget < Widget
  include Mongoid::Document
  
  field :text
  
end