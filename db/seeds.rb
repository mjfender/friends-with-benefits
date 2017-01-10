def random_pluck(model)
  offset = rand(model.count)
  rand_record = model.offset(offset).first
end

def phrase_generator(range = (1..4))
  rand(range)
end


def birth_humans
  human = User.new
  human.name = FFaker::Name.name
  human.email = FFaker::Internet.email
  human.password = 'password'
  human.bio = FFaker::HipsterIpsum.paragraph
  human.zipcode = FFaker::AddressUS.zip_code
  human.save
end 

def create_needs
  need = Need.new
  need.user = random_pluck(User)
  need.headline = FFaker::HipsterIpsum.phrases(phrase_generator)
  need.description = FFaker::HipsterIpsum.sentences(phrase_generator(0..5))
  need.save
end

def create_replies
  reply = Reply.new
  reply.user = random_pluck(User)
  reply.need = random_pluck(Need)
  reply.comment = FFaker::HipsterIpsum.paragraph
  reply.save
end


20.times { birth_humans }
80.times { create_needs }
100.times { create_replies }



