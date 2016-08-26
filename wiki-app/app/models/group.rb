class Group < ActiveRecord::Base
  validates_presence_of :name, :description
  has_many :memberships
  has_many :members, :through => :memberships, :source => :user

  has_many :articles
  has_and_belongs_to_many :categories

  def member_count
    self.members.count
  end
end
