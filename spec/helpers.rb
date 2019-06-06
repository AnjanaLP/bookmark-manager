require 'pg'

def persisted_data(id:, table:)
  connection = PG.connect(dbname: "bookmark_manager_test")
  result = connection.exec("SELECT * FROM #{table} where id = '#{id}';")
  result.first
end
