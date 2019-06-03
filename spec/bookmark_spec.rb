require 'bookmark'

describe Bookmark do

  describe '.all' do
    it 'returns all the bookmarks' do
      bookmark = Bookmark.create(url: 'http://bbc.co.uk', title: 'BBC')
      Bookmark.create(url: 'http://cnn.com', title: 'CNN')
      Bookmark.create(url: 'http://google.co.uk', title: 'Google')

      bookmarks = Bookmark.all
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.url).to eq 'http://bbc.co.uk'
      expect(bookmarks.first.title).to eq 'BBC'
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: "http://newbookmark.com", title: "New Bookmark")
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.url).to eq "http://newbookmark.com"
      expect(bookmark.title).to eq "New Bookmark"
    end

    it 'does not create a bookmark with an invald url' do
      Bookmark.create(url: "invalidbookmark", title: "Invalid Bookmark")
      expect(Bookmark.all.length).to eq 0
    end
  end

  describe '.delete' do
    it 'deletes the given bookmark' do
      bookmark = Bookmark.create(url: "http://testbookmark.com", title: "Test Bookmark")
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq 0
    end
  end

  describe '.update' do
    it 'updates a bookmark with the given information' do
      bookmark = Bookmark.create(url: "http://testbookmark.com", title: "Test Bookmark")
      updated_bookmark = Bookmark.update(id: bookmark.id, url: "http://updatedbookmark.com", title: "Updated bookmark")
      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.url).to eq "http://updatedbookmark.com"
      expect(updated_bookmark.title).to eq "Updated bookmark"
    end
  end

  describe '.find' do
    it 'returns the bookmark with the given id' do
      bookmark = Bookmark.create(url: "http://testbookmark.com", title: "Test Bookmark")
      returned_bookmark = Bookmark.find(id: bookmark.id)
      expect(returned_bookmark).to be_a Bookmark
      expect(returned_bookmark.id).to eq bookmark.id
      expect(returned_bookmark.url).to eq "http://testbookmark.com"
      expect(returned_bookmark.title).to eq "Test Bookmark"
    end
  end
end
