require 'rails_helper'

feature 'Snaps' do

  context 'posting snaps' do
    before do
      visit '/'
      click_link 'New snap'
    end

    scenario 'allows user to post a snap and a comment' do
      attach_file('Image', "spec/files/images/01.jpg")
      fill_in 'Caption', with: 'Turkish awesomeness #coffee'
      click_button 'Add a snap'
      expect(page).to have_content('#coffee')
      expect(page).to have_css("img[src*='01.jpg']")
    end

  end

end
