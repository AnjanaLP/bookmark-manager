require 'bookmark'

describe Bookmark do
  let(:comment_class)       { double :comment_class }
  let(:tag_class)           { double :tag_class }

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
      persisted_data = persisted_data(id: bookmark.id, table: 'bookmarks')

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

  describe '#comments' do
    it 'calls .where on the Comment class' do
      bookmark = Bookmark.create(url: "http://testbookmark.com", title: "Test Bookmark")

      expect(comment_class).to receive(:where).with(bookmark_id: bookmark.id)
      bookmark.comments(comment_class)
    end
  end

  describe '#tags' do
    it 'calls .where on the Tag class' do
      bookmark = Bookmark.create(url: "http://testbookmark.com", title: "Test Bookmark")

      expect(tag_class).to receive(:where).with(bookmark_id: bookmark.id)
      bookmark.tags(tag_class)
    end
  end

  describe '.where' do
    it 'returns the bookmarks with the given tag id' do
      bookmark_1 = Bookmark.create(url: "http://firstbookmark.com", title: "First Bookmark")
      bookmark_2 = Bookmark.create(url: "http://secondbookmark.com", title: "Second Bookmark")
      tag_1 = Tag.create(content: "First Tag")
      tag_2 = Tag.create(content: "Second Tag")
      BookmarkTag.create(bookmark_id: bookmark_1.id, tag_id: tag_1.id)
      BookmarkTag.create(bookmark_id: bookmark_2.id, tag_id: tag_1.id)
      BookmarkTag.create(bookmark_id: bookmark_1.id, tag_id: tag_2.id)

      bookmarks = Bookmark.where(tag_id: tag_1.id)
      result = bookmarks.first

      expect(bookmarks.length).to eq 2
      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark_1.id
      expect(result.url).to eq bookmark_1.url
      expect(result.title).to eq bookmark_1.title
    end
  end
end
