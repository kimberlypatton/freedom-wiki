class User < ActiveRecord::Base
  has_secure_password

  has_many :memberships
  has_many :groups, :through => :memberships

  def fullname
    self.first_name.capitalize + " " + self.last_name.capitalize
  end
end
