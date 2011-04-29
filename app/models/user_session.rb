class UserSession < Authlogic::Session::Base
  def to_key
    # if new_record.save(:validate => false)
      # nil 
    # else 
      # self.send(self.class.primary_key)
    # end
    new_record? ? nil : [ self.send(self.class.primary_key) ]
  end
end
