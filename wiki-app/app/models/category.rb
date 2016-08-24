class Category < ActiveRecord::Base

  validates :name, presence: true

  belongs_to :groups, through: :categories_groups
  has_many :groups, through: :categories_groups


end
