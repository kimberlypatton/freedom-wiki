class User < ActiveRecord::Base
  has_secure_password

  has_many :memberships
  has_many :groups, :through => :memberships

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
