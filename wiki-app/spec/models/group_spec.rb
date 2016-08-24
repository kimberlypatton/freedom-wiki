require 'rails_helper'

describe Group do
  let(:group){Group.new(name:"Name", description: "This is a group description.")}
  let(:group2){Group.new(description: "This is a group description.")}
  describe "validations" do
    it "is valid when it has a name and description" do
      expect(group).to be_valid
    end
    it "is invalid without a name" do
      expect(group2).to be_invalid
    end
  end

  describe "group attributes" do
    it "has a name" do
      expect(group.name).to eq "Name"
    end
    it "has a description" do
      expect(group.description).to eq "This is a group description."
    end
  end
end
