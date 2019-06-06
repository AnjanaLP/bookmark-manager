require 'pg'

task :setup_test_database do
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("TRUNCATE TABLE bookmarks, comments, tags, bookmarks_tags, users;")
end
