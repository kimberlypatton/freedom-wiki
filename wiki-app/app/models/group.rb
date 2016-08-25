class Group < ActiveRecord::Base
  validates :name, :description, {presence: true}
  has_many :memberships
  has_many :members, :through => :memberships, :source => :user

  has_many :articles
end
