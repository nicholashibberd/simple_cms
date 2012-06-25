class ImageWidget < Widget
  belongs_to :image
  
  field :caption
  field :display_in_lightbox, :default => false, :type => Boolean
  field :width, :type => Integer
  field :link
  
end