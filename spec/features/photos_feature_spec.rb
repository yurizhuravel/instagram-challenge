require 'rails_helper'

feature 'Snaps' do

  context 'posting snaps' do
    before do
      visit '/snaps'
      click_link 'Add a snap'
    end

    scenario 'allows user to post a snap and a comment' do
      attach_file('Image', "./app/assets/images/01.jpg")
      fill_in 'Caption', with: 'Turkish awesomeness #coffee'
      click_button 'Create Snap'
      expect(page).to have_content('#coffee')
      expect(page).to have_css("img[src*='01.jpg']")
    end

  end

end
