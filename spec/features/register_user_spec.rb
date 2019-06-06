feature 'User registration' do
  scenario 'a user can register' do
    visit '/'
    click_button 'Sign Up'
    expect(current_path).to eq '/users/new'

    fill_in 'Email', with: "anjana@example.com"
    fill_in "Password", with: "password123"
    click_button "Submit"

    expect(page).to have_content "Hello, anjana@example.com"
  end
end
