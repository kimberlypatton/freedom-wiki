require 'rails_helper'

describe Group do
  let(:user) { User.create!(first_name: 'bob',
                            email: 'bob@bob.com',
                            last_name: 'doe',
                            password: 'test'
                            )}
  let(:group){Group.create!(name:"Name", description: "This is a group description.")}
  let(:group2){Group.new(description: "This is a group description.")}

  context "validations" do
    it "is valid when it has a name and description" do
      expect(group).to be_valid
    end
    it "is invalid without a name" do
      expect(group2).to be_invalid
    end
  end

  context "attributes" do
    it "has a name" do
      expect(group.name).to eq "Name"
    end
    it "has a description" do
      expect(group.description).to eq "This is a group description."
    end
  end

  describe "#admin" do
    it 'returns its admin' do
      group.memberships.create(user: user, role: 'admin')
      expect(group.admin).to eq user
    end
  end

  describe "#member_count" do
    it 'returns the number of members in the group' do
      group.memberships.create(user: user, role: 'admin')
      expect(group.member_count).to eq 1
    end
  end
end
