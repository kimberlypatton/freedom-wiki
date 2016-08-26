class CategoryGroup < ActiveRecord::Base

  belongs_to :category
  belongs_to :group

  # validates :category

end
