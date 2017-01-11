require 'rails_helper'

describe Reply do

  let(:user) {
    User.create(
    :name => "bob",
    :email => "bob@bob.com",
    :password => "password"
    )
  }

  let(:need) {
    Need.create(
    :user_id => user.id,
    :headline => "need some cheese!"
    )
  }

  let(:reply) {
    Reply.create(
    :user_id => user.id,
    :need_id => need.id,
    :yes => true
    )
  }

  it "belongs to one user" do
    expect(reply.user).to eq(user)
  end

  it "belongs to one need" do
    expect(reply.need).to eq(need)
  end

  it "is valid with a yes" do
    expect(reply).to be_valid
  end

  it 'is valid with a comment' do
    new_reply = Reply.new(
    user_id: user.id,
    need_id: need.id,
    yes: false,
    comment: "Can't wait bugaboo!")
    expect(new_reply).to be_valid
  end

  it 'is valid with a yes and comment' do
    new_reply = Reply.new(
    user_id: user.id,
    need_id: need.id,
    yes: true,
    comment: "Can't wait bugaboo!")
    expect(new_reply).to be_valid
  end

  it 'is invalid without a yes and comment' do
    new_reply = Reply.new(
    user_id: user.id,
    need_id: need.id,)
    expect(new_reply).to_not be_valid
  end

end
