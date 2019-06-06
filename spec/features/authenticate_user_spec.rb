feature 'User authentication' do

  before do
    User.create(email: "anjana@example.com", password: "password123")
    visit '/'
    click_button "Login"
    expect(current_path).to eq '/sessions/new'
  end

  context 'correct email and password entered' do
    before do
      fill_in "Email", with: "anjana@example.com"
      fill_in "Password", with: "password123"
      click_button "Login"
    end

    scenario 'user successfully logs in' do
      expect(current_path).to eq '/bookmarks'
      expect(page).to have_content "Hello, anjana@example.com"
    end

    scenario 'user successfully logs out' do
      click_button 'Logout'
      expect(current_path).to eq '/bookmarks'
      expect(page).not_to have_content "Hello, anjana@example.com"
      expect(page).to have_content "You have successfully logged out"
    end
  end

  context 'incorrect email entered' do
    scenario 'user sees an error' do
      fill_in "Email", with: "wrong_email@example.com"
      fill_in "Password", with: "pasword123"
      click_button "Login"

      expect(current_path).to eq '/sessions/new'
      expect(page).not_to have_content "Hello, anjana@invalid.com"
      expect(page).to have_content "Please check your email/password and try again"
    end
  end

  context 'incorrect password entered' do
    scenario 'user sees an error' do
      fill_in "Email", with: "anjana@example.com"
      fill_in "Password", with: "wrong_password"
      click_button "Login"

      expect(current_path).to eq '/sessions/new'
      expect(page).not_to have_content "Hello, anjana@example.com"
      expect(page).to have_content "Please check your email/password and try again"
    end
  end
end
