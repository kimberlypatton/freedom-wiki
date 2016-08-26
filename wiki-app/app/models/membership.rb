class Membership < ActiveRecord::Base
  validates_presence_of :user, :group, :role
  validates :user_id, uniqueness: { scope: :group_id }

  belongs_to :user
  belongs_to :group

  ROLES = %w( admin member guest )
end
