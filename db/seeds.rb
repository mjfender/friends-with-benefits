def birth_humans
  human = User.new
  human.name = FFaker::Name.name
  human.email = FFaker::Internet.email
  human.password = 'password'
  human.groups << Group.find(1)
  human.default_group = 1
  human.bio = FFaker::HipsterIpsum.paragraph
  human.zipcode = FFaker::AddressUS.zip_code
  human.join_group( random_pluck( Group ) )
  human.save
end 

def create_needs
  need = Need.new
  need.user = random_pluck(User)
  need.headline = FFaker::HipsterIpsum.phrases(phrase_generator).join
  need.description = FFaker::HipsterIpsum.sentences(phrase_generator(0..5)).join
  need.groups << need.user.groups.sample
  need.save
end

def create_replies
  reply = Reply.new
  reply.user = random_pluck(User)
  reply.need = random_pluck(Need)
  reply.comment = FFaker::HipsterIpsum.paragraph
  reply.save
end

def create_groups
  group = Group.new
  group.title = FFaker::HipsterIpsum.phrase
  group.description = FFaker::HipsterIpsum.sentences(phrase_generator).join
  group.save
end

def add_admin_to_groups
  groups = Group.all
  groups.each do |group| 
    group.set_admin(random_pluck( User ))
  end
end

def create_memberships
  group = random_pluck( Group )
  user = random_pluck( User )
  Membership.find_or_create_by(group: group, user: user)
end 



def random_pluck(model)
  offset = rand(model.count)
  rand_record = model.offset(offset).first
end

def phrase_generator(range = (1..4))
  rand(range)
end

puts 'Creating groups....'
15.times { create_groups }

puts 'Making Humans......'
50.times { birth_humans }

puts 'Making group admins....'
add_admin_to_groups

puts 'And adding members...'
70.times { create_memberships }



puts 'Giving the humans some needs....'
80.times { create_needs }

puts 'And, finally, giving them helpful responses....'
100.times { create_replies }




