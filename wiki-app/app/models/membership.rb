class Membership < ActiveRecord::Base
  validates :user_id, uniqueness: { scope: :group_id }
  belongs_to :user
  belongs_to :group

  ROLES = %w( admin member guest )
end
