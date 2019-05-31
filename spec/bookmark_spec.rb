require 'bookmark'

describe Bookmark do

  describe '.all' do
    it 'returns all the bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://bbc.co.uk');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://cnn.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://google.co.uk');")

      bookmarks = Bookmark.all
      expect(Bookmark.all).to include "http://bbc.co.uk"
      expect(Bookmark.all).to include "http://cnn.com"
      expect(Bookmark.all).to include "http://google.co.uk"
    end
  end
end
