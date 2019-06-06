feature 'Filter bookmarks' do
  scenario 'a user can filter bookmarks by tag' do
    Bookmark.create(url: 'http://bbc.co.uk', title: 'BBC')
    Bookmark.create(url: 'http://cnn.com', title: 'CNN')
    Bookmark.create(url: 'http://google.co.uk', title: 'Google')

    visit('/bookmarks')

	  within page.find('.bookmark:nth-of-type(1)') do
	     click_button 'Add tag'
	  end
    fill_in 'Tag', with: 'Testing'
    click_button 'Submit'

    within page.find('.bookmark:nth-of-type(2)') do
      click_button 'Add tag'
    end
    fill_in 'Tag', with: 'Testing'
    click_button 'Submit'

	  first('.bookmark').click_link 'Testing'

    expect(page).to have_link 'BBC', href: 'http://bbc.co.uk'
    expect(page).not_to have_link 'Google', href: 'http://google.co.uk'
  end
end
