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
  end

  describe '.delete' do
    it 'deletes the given bookmark' do
      bookmark = Bookmark.create(url: "http://testbookmark.com", title: "Test Bookmark")

      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq 0
    end
  end
end
