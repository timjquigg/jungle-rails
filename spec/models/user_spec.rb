require 'rails_helper'

RSpec.describe User, type: :model do
  it 'creates a user when given first_name, last_name, email, password, password_confirmation' do
    @user = User.create(first_name: 'Jane', last_name: 'Doe', email: 'jane@example.com', password: 'password', password_confirmation: 'password')
    expect(@user).to be_instance_of(User)
  end
  
  it 'returns an error if password is missing' do
    @user = User.create(first_name: 'Jane', last_name: 'Doe', email: 'jane@example.com', password_confirmation: 'password')
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end
  
  it 'returns an error if password_confirmation is missing' do
    @user = User.create(first_name: 'Jane', last_name: 'Doe', email: 'jane@example.com', password: 'password')
    expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
  end
  
  it 'returns an error if password and password_confirmation do not match' do
    @user = User.create(first_name: 'Jane', last_name: 'Doe', email: 'jane@example.com', password: 'password', password_confirmation: 'password1')
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
  
  it 'returns an error if an e-mail already exists' do
    @user = User.create(first_name: 'Jane', last_name: 'Doe', email: 'jane@example.com', password: 'password', password_confirmation: 'password')
    
    @user1 = User.create(first_name: 'Jane', last_name: 'Doe', email: 'JANE@example.com', password: 'password', password_confirmation: 'password')
    expect(@user1.errors.full_messages).to include('Email has already been taken')
  end
  
  it 'returns an error if first_name is missing' do
    @user = User.create(last_name: 'Doe', email: 'jane@example.com', password: 'password', password_confirmation: 'password')
    expect(@user.errors.full_messages).to include("First name can't be blank")
  end
  
  it 'returns an error if last_name is missing' do
    @user = User.create(first_name: 'Jane', email: 'jane@example.com', password: 'password', password_confirmation: 'password')
    expect(@user.errors.full_messages).to include("Last name can't be blank")
  end
  
  it 'returns an error if password is too short' do
    @user = User.create(first_name: 'Jane', last_name: 'Doe', email: 'jane@example.com', password: 'pass', password_confirmation: 'pass')
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
  end
  
  describe '.authenticate_with_credentials' do
    it 'validates a user with correct email and password' do
      @user = User.create(first_name: 'Jane', last_name: 'Doe', email: 'jane@example.com', password: 'password', password_confirmation: 'password')
      @valid_user = User.authenticate_with_credentials('jane@example.com', 'password')
      expect(@valid_user).to be_instance_of(User)
    end

    it 'returns nil if incorrect e-mail provided' do
      @user = User.create(first_name: 'Jane', last_name: 'Doe', email: 'jane@example.com', password: 'password', password_confirmation: 'password')
      @valid_user = User.authenticate_with_credentials('jane@example1.com', 'password')
      expect(@valid_user).to be(nil)
    end

    it 'returns nil if incorrect password provided' do
      @user = User.create(first_name: 'Jane', last_name: 'Doe', email: 'jane@example.com', password: 'password', password_confirmation: 'password')
      @valid_user = User.authenticate_with_credentials('jane@example.com', 'password1')
      expect(@valid_user).to be(nil)
    end
    
    it 'validates a user with correct email and password if e-mail contains leading or trailing spaces' do
      @user = User.create(first_name: 'Jane', last_name: 'Doe', email: 'jane@example.com', password: 'password', password_confirmation: 'password')
      @valid_user = User.authenticate_with_credentials('  jane@example.com', 'password')
      @valid_user1 = User.authenticate_with_credentials('jane@example.com  ', 'password')
      expect(@valid_user).to be_instance_of(User)
      expect(@valid_user1).to be_instance_of(User)
    end

  end
end
