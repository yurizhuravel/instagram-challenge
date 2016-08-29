require 'rails_helper'
require 'web_helper'

feature 'Leaving comments' do
  before do
    sign_up
    add_snap
  end

  scenario 'allows users to leave a comment on a snap' do
     visit '/'
     click_link 'Add a comment'
     fill_in "Thoughts", with: "wow wow!"
     click_button 'Post Comment'

     expect(current_path).to eq '/snaps'
     expect(page).to have_content('wow wow!')
  end

end
