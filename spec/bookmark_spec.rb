require 'bookmark'

describe Bookmark do

  describe '.all' do
    it 'returns all the bookmarks' do
      Bookmark.create(url: 'http://bbc.co.uk')
      Bookmark.create(url: 'http://cnn.com')
      Bookmark.create(url: 'http://google.co.uk')

      bookmarks = Bookmark.all
      expect(Bookmark.all).to include "http://bbc.co.uk"
      expect(Bookmark.all).to include "http://cnn.com"
      expect(Bookmark.all).to include "http://google.co.uk"
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Bookmark.create(url: "http://newbookmark.com")
      expect(Bookmark.all).to include "http://newbookmark.com"
    end
  end
end
