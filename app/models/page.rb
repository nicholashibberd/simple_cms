class Page 
  include Mongoid::Document 
  
  field :name, :type => String
  field :slug, :type => String
  field :title, :type => String
  field :header, :type => String
  field :template
  field :layout  

  has_and_belongs_to_many :photos  
  before_create :generate_slug
  validates_presence_of :name
  
  def generate_slug
    self.slug = name.gsub("'", "").parameterize
  end
  
  def to_param
    slug
  end

  def self.find_by_slug(slug)
    slug ? self.where(:slug => slug).first : Site.instance.homepage
  end
  
  def page_type
    self._type ? self._type.underscore : 'page'
  end
  
  def update_page(page_type_params)
    params_with_photos = page_type_params[:photo_ids] ? page_type_params : page_type_params.merge(:photo_ids => [])
  	update_attributes(params_with_photos)
  end
      
end