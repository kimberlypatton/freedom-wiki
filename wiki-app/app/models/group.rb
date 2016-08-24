class Group < ActiveRecord::Base

  validates :name, :description, {presence: true}

end
