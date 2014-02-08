require 'spec_helper'

describe User do
  it "is invalid without an email address" do
    user = FactoryGirl.attributes_for(:user)
    user[:email] = nil
    expect(user).to have(3).errors_on(:email)
  end

  it "is invalid without a unique email" do
    user1 = create(:user, email: "test@example.com")
    user2 = User.new(
      password: "12345678", 
      password_confirmation: "12345678", 
      email: "test@example.com"
    )
    expect(user2).to have(1).error_on :email
  end

  it "is invalid with an incorrect password confirmation" do
    user = User.new(
      password: "12345678", 
      password_confirmation: "13264578", 
      email: "test@example.com"
    )
    expect(user).to have(1).error_on :password_confirmation
  end

  it "is valid with a email, pass, and confirmation" do
    user = User.new(
      password: "12345678",
      password_confirmation: "12345678",
      email: "test@example.com"
    )
    expect(user).to be_valid
  end
end
