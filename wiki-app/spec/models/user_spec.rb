require 'rails_helper'

describe User do
  let(:group){ Group.create!(name:"Name", description: "This is a group description.") }
  let(:user) { User.create!(first_name: 'bob',
                            email: 'bob@bob.com',
                            last_name: 'doe',
                            password: 'test'
                            )}
  let(:article){ Article.new(name: "Sports is cool",
                             content: "Hey, this is the content of this article!!",
                             user: user
                             )}

  context 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should have_secure_password }
  end

  context '#fullname' do
    it 'returns the users fullname' do
      expect(user.fullname).to eq 'Bob Doe'
    end
  end

  context '#featured_articles' do
    it 'returns the article from the group it is in' do
      user.memberships.create(group: group, role: 'member')
      group.articles << article
      expect(user.featured_articles).to eq [article]
    end
  end
end
