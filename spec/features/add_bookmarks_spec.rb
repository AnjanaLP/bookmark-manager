feature 'Add bookmarks' do

  before do
    visit '/bookmarks'
    click_button "Add bookmark"
    expect(current_path).to eq '/bookmarks/new'
  end

  scenario 'a user can add a bookmark' do
    fill_in "URL", with: "http://newbookmark.com"
    fill_in "Title", with: "New Bookmark"
    click_button "Submit"
    expect(current_path).to eq '/bookmarks'
    expect(page).to have_link("New Bookmark", href: "http://newbookmark.com")
  end

  scenario "the bookmark's url must be valid" do
    fill_in "URL", with: "invalidbookmark"
    fill_in "Title", with: "Invalid Bookmark"
    click_button "Submit"
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link("Invalid Bookmark", href: "invalidbookmark")
    expect(page).to have_content "Please submit a valid url"
  end
end
