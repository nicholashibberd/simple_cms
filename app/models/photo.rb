class Photo 
  include Mongoid::Document
  
  field :cover_image_uid
  field :name
  field :caption
  field :link
  field :photo_type, :default => 'content'
  
  has_and_belongs_to_many :pages
  validates_presence_of :name
  validates_uniqueness_of :name
  
  image_accessor :cover_image
  
  scope :background_images, where(:photo_type => 'background_image')
end
