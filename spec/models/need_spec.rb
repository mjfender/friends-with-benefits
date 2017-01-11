require_relative '../rails_helper'

describe Need do
    let(:valid_need) { Need.create(headline: 'I need cat help right meow', user_id: user.id, expiration: "2018-03-05 00:00:00") }
    let(:valid_need2) { Need.create(headline: 'I need to practice French', user_id: user2.id, expiration: "2018-03-08 00:00:00") }
    let(:long_invalid_need) { Need.create(headline: 'I need cat help right meow meow meow meow meow meow meow meow meow meow meow meow meow meow meow meowwwwwwwwwwwwwwwwwww MEOW MEOW MEOW MEOW MEOWWWWW MEOW MEOW MEOW!!! RIGHT MEOW!', user_id: user.id, expiration: "2018-03-03 00:00:00") }
    let(:headline_missing_invalid_need) { Need.create(user_id: user.id, expiration: "2018-03-03 00:00:00") }
    let(:user_missing_invalid_need) { Need.create(headline: 'I need cat help right meow meow meow meow meow meow meow meow meow meow meow meow meow meow meow meowwwwwwwwwwwwwwwwwww MEOW MEOW MEOW MEOW MEOWWWWW MEOW MEOW MEOW!!! RIGHT MEOW!', expiration: "2018-03-03 00:00:00", ) }

    let(:user) { User.create(name: 'Mizzy Jender', email: 'mizzy.jender@gmail.com', bio:'yee haw!', password: '1234')}
    let(:user2) { User.create(name: 'Mashley Robinder', email: 'mashley.robinder@gmail.com', bio:'giddy up!', password: '1234')}

    context 'validations' do

        it 'is valid with a headline and a user_id' do
            expect(valid_need).to be_valid
        end

        it 'is invalid without a user_id' do
            expect(user_missing_invalid_need).to_not be_valid
        end

        it 'is invalid without a headline' do
            expect(headline_missing_invalid_need).to_not be_valid
        end
    end
  
    context 'class methods' do
            
        it 'should have a collection of specified user needs' do
            user
            valid_need
            user2
            valid_need2
            expect(Need.mine_and_theirs(user.id)[:my_needs]).to include(valid_need)
        end

        it 'should have a collection of other user needs' do
            user
            valid_need
            user2
            valid_need2
            expect(Need.mine_and_theirs(user.id)[:others_needs]).to include(valid_need2)
        end
    end
    
 end
