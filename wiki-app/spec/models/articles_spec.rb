require 'rails_helper'

describe Article do
  let(:user){User.create(first_name: "sean", last_name: "witt", email: "Sean@sean.com", password: "password")}
  let(:group){Group.create(name:"Name", description: "This is a group description.")}
  let(:article){Article.new(name: "Sports is cool", content: "Hey, this is the content of this article!!", user_id: user.id, group_id: group.id)}
  let(:article2){Article.new(content: "Hey, this is the content of this article!!")}

  describe "validations" do
    it "is valid when it has a name and content" do
      expect(article).to be_valid
    end
    it "is invalid without a name" do
      expect(article2).to be_invalid
    end
  end

  describe "group attributes" do
    it "has a name" do
      expect(article.name).to eq "Sports is cool"
    end

    it "has content" do
      expect(article.content).to eq "Hey, this is the content of this article!!"
    end

    it "has a user" do
      expect(article.user).to eq user
    end

    it "has a group" do
      expect(article.group).to eq group
    end
  end
end
