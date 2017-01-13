require_relative '../rails_helper'

describe User do


  context 'validations' do
    let(:user) { User.new(name: 'Dave', email: 'dave@minion.net', password: 'password') }
    let(:invalid_user) { User.new }

    it 'is valid with a name, an email, and a password' do
      expect(user).to be_valid
    end

    it 'is invalid without a name' do
      invalid_user.valid?
      expect(invalid_user.errors.full_messages).to include("Name can't be blank")
    end

    it 'is invalid without an email' do
      invalid_user.valid?
      expect(invalid_user.errors.full_messages).to include("Email can't be blank")
    end

    it 'is invalid without a password' do
      invalid_user.valid?
      expect(invalid_user.errors.full_messages).to include("Password can't be blank")
    end
  end


  context 'user joins a group' do
    it 'can join a group' do
      user = User.new(name: 'Carl', email: 'carl@minion.net', password: 'word')
      tutors = Group.new
      user.join_group(tutors)
      expect(tutors.users).to include(user)
    end
  end


  context 'displaying the user name' do
    it 'should display "You" instead of user name if that user is logged in' do
       user = User.new(id: 1, name: 'Dave', email: 'dave@minion.net', password: 'password')
       expect(user.display_name(1)).to eq("You")
    end

    it 'should display the name of the user if that user is not logged in' do
      user = User.new(id: 2, name: 'Kevin', email: 'kevin@minion.net', password: 'pass')
      expect(user.display_name(1)).to eq("Kevin")
    end
  end


end
