require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("TRUNCATE TABLE bookmarks;")
end

def persisted_data(id:)
  connection = PG.connect(dbname: "bookmark_manager_test")
  result = connection.exec("SELECT * FROM bookmarks where id = #{id};")
  result.first
end
