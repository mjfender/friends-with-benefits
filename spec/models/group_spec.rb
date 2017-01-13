require 'rails_helper'

RSpec.describe Group, type: :model do

  it 'allows users to join' do
    user = create(:user)
    group = create(:group)
    user.join_group(group)
    expect(group.users).to include(user)
  end

  it 'allows users to create new groups' do

  end
  it 'allows members to leave' do
    user = create(:user)
    group = create(:group)
    user.join_group(group)
    user.quit_group(group)
    expect(group.users).not_to include(user)
  end

  it 'when a member leaves a group, their needs are also removed from the group' do
    group = create(:group)
    need = create(:need)
    user = create(:user_with_needs, group: group, need: need )
    user.quit_group(group)
    expect(group.needs).not_to include(need)
  end

  it 'has a listing of its users needs'
  it 'has a title & description'
  it 'has at least one admin'
  it 'shows a list of others members to group members'
  it 'shows the number of members to non-members'
  it 'has a join button for non-members'
  it 'has a leave button for members'

end
