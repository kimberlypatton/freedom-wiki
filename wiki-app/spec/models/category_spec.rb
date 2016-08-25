require 'rails_helper'

describe Category do
  let(:category){Category.new(name: "Sports")}
  let(:category2){Category.new}
  describe "validations" do
    it "is valid when it has a name" do
      expect(category).to be_valid
    end
    it "is invalid without a name" do
      expect(category2).to be_invalid
    end
  end

  describe "group attributes" do
    it "has a name" do
      expect(category.name).to eq "Sports"
    end
  end
end
