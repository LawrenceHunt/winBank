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

  context 'achievements have been added' do
    scenario 'should list the achievement' do
      user = User.create(email: 'test@test.com', password: 'password', id: 0)
      user.achievements.create(description: 'Test description')
      visit 'users/0'
      expect(page).not_to have_content 'You have no achievements yet'
      expect(page).to have_content 'Test description'
    end
  end

 context 'achievement added with leadership tag' do

    scenario 'should show that the achievement is a leadership achievement' do
      user = User.create(email: 'test@test.com', password: 'password', id: 0)
      user.achievements.create(description: 'Test description', leadership: true)
      visit 'users/0'
      expect(page).not_to have_content 'You have no achievements yet'
      expect(page).to have_content 'Test description'
      expect(page).to have_content 'Leadership'
    end

  end

  context 'achievement added with efficiency tag' do

    scenario 'should show that the achievement is an efficiency achievement' do
      user = User.create(email: 'test@test.com', password: 'password', id: 0)
      user.achievements.create(description: 'Test description', efficiency: true)
      visit 'users/0'
      expect(page).to have_content 'Test description'
      expect(page).to have_content 'Efficiency'
    end
  end

  context 'achievement added with both efficiency and leadership tag' do

    scenario 'should show that the achievement has both tags' do
      user = User.create(email: 'test@test.com', password: 'password', id: 0)
      user.achievements.create(description: 'Efficient Leadership Achievement', efficiency: true, leadership:true)
      visit 'users/0'
      expect(page).to have_content 'Efficiency'
      expect(page).to have_content 'Leadership'

    end

  end

  context 'see the number of achievements with each tag' do

    scenario 'show a count for leadership achievements' do
      user = User.create(email: 'test@test.com', password: 'password', id: 0)
      user.achievements.create(description: 'Efficient Leadership Achievement', efficiency: true, leadership:true)
      visit 'users/0'
      expect(page).to have_content("Theme Counts:")
      expect(page).to have_content("Leadership: 1")
      save_and_open_page
    end

  end


end
