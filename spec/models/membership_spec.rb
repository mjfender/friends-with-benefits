require 'rails_helper'

RSpec.describe Membership, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  let(:user) {
    User.create(
    :name => "bob",
    :email => "bob@bob.com",
    :password => "password"
    )
  }

  let(:group) {
    Group.create(
    :title => "skiiers"
    )
  }

  let(:membership) {
    Membership.create(
    :group_id => group.id,
    :user_id => user.id
    )
  }


  it 'belongs to one group' do
    expect(membership.group).to eq(group)
  end

  it 'belongs to one user' do
    expect(membership.user).to eq(user)
  end

end
