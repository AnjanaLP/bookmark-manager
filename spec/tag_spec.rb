require 'tag'
require 'bookmark'
require 'bookmark_tag'

describe Tag do

  describe '.create' do
    it 'creates a new tag' do
      tag = Tag.create(content: "Testing")

      persisted_data = persisted_data(id: tag.id, table: 'tags')

      expect(tag).to be_a Tag
      expect(tag.id).to eq persisted_data['id']
      expect(tag.content).to eq "Testing"
    end
  end

  describe '.where' do
    it 'returns the tags for the given bookmark id' do
      bookmark = Bookmark.create(url: "http://testbookmark.com", title: "Test Bookmark")
      first_tag = Tag.create(content: "First Tag")
      second_tag = Tag.create(content: "Second Tag")
      BookmarkTag.create(bookmark_id: bookmark.id, tag_id: first_tag.id)
	    BookmarkTag.create(bookmark_id: bookmark.id, tag_id: second_tag.id)

      tags = Tag.where(bookmark_id: bookmark.id)
      tag = tags.first
      persisted_data = persisted_data(table: 'tags', id: tag.id)

      expect(tags.length).to eq 2
      expect(tag).to be_a Tag
      expect(tag.id).to eq persisted_data['id']
      expect(tag.content).to eq "First Tag"
    end
  end
end
