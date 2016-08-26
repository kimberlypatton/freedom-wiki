class Group < ActiveRecord::Base
  validates_presence_of :name, :description
  has_many :memberships
  has_many :members, :through => :memberships, :source => :user

  has_many :articles
  has_and_belongs_to_many :categories

  def admin
    memberships.where(role: 'admin').first.user
  end

  def member_count
    self.members.count
  end
end
