module UserHelper
  def fullname
    self.first_name.capitalize + " " + self.last_name.capitalize
  end
end
