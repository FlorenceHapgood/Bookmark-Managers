require "pg"

class Bookmark
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec("SELECT * FROM bookmarks")
    result.map { |hash| { cocopops: hash["id"], url: hash["url"], title: hash["title"] } }
  end

  def self.create(url, title)
    return false unless is_url?(url)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}')")
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end



end

#
# def self.delete(id)
#   if ENV['ENVIRONMENT'] == 'test'
#     connection = PG.connect(dbname: 'bookmark_manager_test')
#   else
#     connection = PG.connect(dbname: 'bookmark_manager')
#   end
#
#   connection.exec("")
# end
