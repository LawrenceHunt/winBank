require 'rails_helper'

feature 'achievements' do
  context 'no achievements have been added' do
    scenario 'should give a message when there are no achievements' do
      visit '/'
      user = User.create(email: 'test@test.com', password: 'password', id: 0)
      visit 'users/0'
      expect(page).to have_content 'You have no achievements yet'
    end
  end
end
