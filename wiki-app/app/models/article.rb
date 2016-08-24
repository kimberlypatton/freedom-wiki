class Article < ActiveRecord::Base

  validates :name, :content, presence: true

  belongs_to :user
  belongs_to :groups

end
