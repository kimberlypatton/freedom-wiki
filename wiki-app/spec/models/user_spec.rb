require 'rails_helper'

describe User do
  let(:user) { User.create!(first_name: 'bob',
                            email: 'bob@bob.com',
                            last_name: 'doe',
                            password: 'test'
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
end
