class Site
  include Mongoid::Document
  
  field :homepage_id
  
  def homepage
    homepage_id ? Page.find(homepage_id) : Page.first
  end
    
  # Class methods
  class << self

    # We can only get the homepage object by calling Homepage.instance
    def instance
      first || create!
    end
    
    private :new

  end
end