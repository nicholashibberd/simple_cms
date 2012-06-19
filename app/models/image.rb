class Image
  include Mongoid::Document
  
  field :cover_image_uid
  field :name
  field :caption
  field :link
  field :image_type, :default => 'content'
  
  has_and_belongs_to_many :pages
  has_many :image_widgets
  validates_presence_of :name
  validates_uniqueness_of :name
  
  image_accessor :cover_image
  
  scope :background_images, where(:image_type => 'background_image')
end
