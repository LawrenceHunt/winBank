require 'rails_helper'

feature 'achievements' do
  context 'no achievements have been added' do
    scenario 'should give a message when there are no achievements' do
      visit '/achievements'
      expect(page).to have_content 'You have no achievements yet'
    end
  end
end
