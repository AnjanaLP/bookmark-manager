require 'bookmark'

describe Bookmark do

  describe '.all' do
    it 'returns all the bookmarks' do
      bookmarks = Bookmark.all
      expect(Bookmark.all).to include "http://bbc.co.uk"
      expect(Bookmark.all).to include "http://cnn.com"
      expect(Bookmark.all).to include "http://google.co.uk"
    end
  end
end
