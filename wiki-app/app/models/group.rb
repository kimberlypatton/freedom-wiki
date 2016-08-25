class Group < ActiveRecord::Base
  validates :name, :description, {presence: true}
  has_many :memberships
  has_many :members, :through => :memberships, :source => :user

  has_many :articles

  def member_count
    self.members.count
  end
end
