require 'comment'
require 'bookmark'

describe Comment do

  describe '.create' do
    it 'creates a new comment on a bookmark' do
      bookmark = Bookmark.create(url: "http://testbookmark.com", title: "Test bookmark")
      comment = Comment.create(text: "Test comment", bookmark_id: bookmark.id)

      persisted_data = persisted_data(id: comment.id, table: 'comments')

      expect(comment).to be_a Comment
      expect(comment.id).to eq persisted_data['id']
      expect(comment.text).to eq "Test comment"
      expect(comment.bookmark_id).to eq bookmark.id
    end
  end

  describe '.where' do
    it 'gets the relevant comments from the database' do
      bookmark = Bookmark.create(url: "http://testbookmark.com", title: "Test Bookmark")
      first_comment = Comment.create(text: "First test comment", bookmark_id: bookmark.id)
      second_comment = Comment.create(text: "Second test comment", bookmark_id: bookmark.id)

      comments = Comment.where(bookmark_id: bookmark.id)
      comment = comments.first
      persisted_data = persisted_data(table: 'comments', id: comment.id)

      expect(comments.length).to eq 2
      expect(comment.id).to eq persisted_data['id']
      expect(comment.text).to eq 'First test comment'
      expect(comment.bookmark_id).to eq bookmark.id
    end
  end
end
