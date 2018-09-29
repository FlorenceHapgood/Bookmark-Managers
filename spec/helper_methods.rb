require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'bookmark_manager_test')
  #connection.exec("TRUNCATE comments RESTART IDENTITY;"
  connection.exec("TRUNCATE bookmarks, comments RESTART IDENTITY;")

end
