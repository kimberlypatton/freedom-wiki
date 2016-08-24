require 'test_helper'

describe Group do
  let(:group){Group.new(name:"Name", descritpion: "This is a group description.")}
  describe "validations" do
    it "is valid when it has a name and description" do
      expect(group.class).to eq Group
    end
  end
end
