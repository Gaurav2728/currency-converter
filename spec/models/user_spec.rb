require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'factories' do
    it 'has a valid factory' do
      expect(build(:user)).to be_valid
    end
  end

  describe 'validation' do
    it { should validate_presence_of(:email) }
  end

  let!(:user) { create(:user) }

  describe '.name' do
    it 'return full name' do
      expect(user.name).to eq("#{user.name}")
    end
  end

  describe '.avatar' do
    it 'returns avatar url' do
      expect(user.avatar).to eq(user.avatar)
    end
  end

  describe '.omniauth' do
    let(:auth) { Faker::Omniauth.unique.google }
    let!(:user2) { create(:user, email: auth[:info][:email]) }

    before do
      @auth_user = User.find_by(email: auth[:info][:email])
    end

    it 'saves user details' do
      u = User.find_by(email: @auth_user.email)
      expect(u.email).to eq(auth[:info][:email])
    end
  end
end
