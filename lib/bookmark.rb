require_relative "database_connection"

class Bookmark
  def self.all
    result = DatabaseConnection.query("SELECT * FROM bookmarks")
    result.map { |hash| { id: hash["id"], url: hash["url"], title: hash["title"] } }
  end

  def self.create(url, title)
    return false if is_url?(url) == false
    DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}')")
  end

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = #{id};")
  end

  def self.update(id, address, title)
    return false if is_url?(address) == false
    DatabaseConnection.query("UPDATE bookmarks SET url='#{address}', title='#{title}' WHERE id = #{id};")
  end

  private

  def self.is_url?(url)
    !!(url =~ /\A#{URI::regexp(['http', 'https'])}\z/)
  end

  def self.get_comments(id)
    DatabaseConnection.query("SELECT * FROM comments WHERE bookmark_id = #{id};")
  end

  def self.add_comment(id, comment)
    DatabaseConnection.query("INSERT INTO comments (text,bookmark_id) VALUES('#{comment}',#{id})")
  end

end
