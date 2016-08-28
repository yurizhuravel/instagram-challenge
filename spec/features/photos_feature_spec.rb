require 'rails_helper'

feature 'Snaps' do

  before do
    visit '/snaps'
    click_link 'Add a snap'
    attach_file('Image', "./app/assets/images/01.jpg")
    fill_in 'Caption', with: 'Turkish awesome #coffee'
    click_button 'Create Snap'
  end

  context 'posting snaps' do

    scenario 'allows user to post a snap and a comment' do
      expect(page).to have_content('#coffee')
      expect(page).to have_css("img[src*='01.jpg']")
    end

  end

  context 'viewing snaps' do

    scenario 'shows multiple added snaps on the index page' do
      click_link 'Add a snap'
      attach_file('Image', "./app/assets/images/02.jpg")
      fill_in 'Caption', with: '#hastings'
      click_button 'Create Snap'
      expect(page).to have_content('#hastings')
      expect(page).to have_css("img[src*='02.jpg']")
    end

    scenario 'lets users view individual snaps' do
        visit '/snaps'
        link = find(:xpath, "//a[contains(@href,'01.jpg')]")
        link.click
        expect(page).to have_css("img[src*='01.jpg']")
    end

  end

  context 'deleting' do

    scenario 'allows user to delete a snap' do
      click_link 'Delete snap'
      expect(page).not_to have_content('#coffee')
      expect(page).not_to have_css("img[src*='01.jpg']")
    end

  end

end
