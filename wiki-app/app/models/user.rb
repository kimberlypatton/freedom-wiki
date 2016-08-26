class User < ActiveRecord::Base
  validates_presence_of :first_name, :email
  validates_uniqueness_of :email

  has_many :memberships
  has_many :groups, :through => :memberships
  has_secure_password

  def fullname
    self.first_name.capitalize + " " + self.last_name.capitalize
  end

  def featured_articles
    all = []
    self.groups.each do |group|
      all.push(group.articles)
    end
    return all.flatten
  end
end
