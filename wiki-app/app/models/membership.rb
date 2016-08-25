class Membership < ActiveRecord::Base

  ROLES = %w( admin member guest )

  belongs_to :user
  belongs_to :group
end
