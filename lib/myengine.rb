module MyEngine
  module ClassMethods
    def login_required!
      raise 'login required'
    end
  end
  module InstanceMethods
    def some_awesome_instance_method
    end
  end
end