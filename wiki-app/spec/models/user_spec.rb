require 'rails_helper'

describe User do
  context 'validations' do
    let(:user) { User.create!(first_name: 'bob', email: 'bob@bob.com') }

    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should have_secure_password }
  end
end
