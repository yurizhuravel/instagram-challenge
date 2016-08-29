require 'rails_helper'
require 'web_helper'

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end

    it "should not be able to add snaps" do
      visit '/snaps'
      click_link 'Add a snap'
      expect(page).to have_content('You need to sign in or sign up before continuing')
      expect(page).not_to have_content('Image')
    end

  end

  context "user signed in on the homepage" do
    before do
      sign_up
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end

    it "should be able to add snaps" do
      add_another_snap
      expect(page).to have_content('#stopsign')
      expect(page).to have_css("img[src*='08.jpg']")
    end
  end
end
