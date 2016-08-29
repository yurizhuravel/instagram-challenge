def sign_up
  visit '/users/sign_up'
  fill_in 'Email', with: 'test@test.com'
  fill_in 'Password', with: '123456'
  fill_in 'Password confirmation', with: '123456'
  click_button 'Sign up'
end

def sign_in
  visit '/users/sign_in'
  fill_in 'Email', with: 'test@test.com'
  fill_in 'Password', with: '123456'
  click_button 'Sign in'
end

def sign_out
  visit '/'
  click_link 'Sign out'
end

def add_snap
  visit '/snaps'
  click_link 'Add a snap'
  attach_file('Image', "./app/assets/images/01.jpg")
  fill_in 'Caption', with: 'Turkish awesome #coffee'
  click_button 'Create Snap'
end

def add_another_snap
  visit '/snaps'
  click_link 'Add a snap'
  attach_file('Image', "./app/assets/images/08.jpg")
  fill_in 'Caption', with: '#stopsign'
  click_button 'Create Snap'
end
