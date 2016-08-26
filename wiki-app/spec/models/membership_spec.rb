require 'rails_helper'

describe Membership do
let(:group){ Group.create!(name:"Name", description: "This is a group description.") }
let(:user) { User.create!(first_name: 'bob',
                          email: 'bob@bob.com',
                          last_name: 'doe',
                          password: 'test'
                          )}
let(:membership) { Membership.create!(group: group, user: user, role: 'admin') }

  context 'validations' do
    subject { Membership.new(role:'member') }

    it { should validate_uniqueness_of(:user_id).scoped_to(:group_id) }
    it { should validate_presence_of(:role) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:group) }
  end

  context 'attributes' do
    it 'has a user' do
      expect(membership.user).to eq user
    end

    it 'has a group' do
      expect(membership.group).to eq group
    end
  end
end
