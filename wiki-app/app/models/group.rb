class Group < ActiveRecord::Base

  validates :name, :description, {presence: true}

  # has_many :group_users
  # has_many :users, through: :groups_users

  has_and_belongs_to_many :users
  has_and_belongs_to_many :categories

end
