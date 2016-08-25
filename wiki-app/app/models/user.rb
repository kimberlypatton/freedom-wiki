class User < ApplicationRecord

  has_secure_password

  has_and_belongs_to_many :groups
  has_many :articles

  def fullname
    self.first_name.capitalize + " " + self.last_name.capitalize
  end

end
