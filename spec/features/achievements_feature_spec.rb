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

  context 'creating achievements' do
  scenario 'prompts user to fill out a form, then displays the new acheivement' do
    user = User.create(email: 'test@test.com', password: 'password', id: 0)
    visit 'users/0'
    click_link 'Add achievement'
    fill_in 'Description', with: 'I helped run a craftathon at Makers'
    click_button 'Add achievement'
    expect(page).to have_content 'I helped run a craftathon at Makers'
    expect(current_path).to eq 'users/0'
  end
end


end
