require_relative "database_connection"

class Bookmark
  def self.all
    result = DatabaseConnection.query("SELECT * FROM bookmarks")
    result.map { |hash| { cocopops: hash["id"], url: hash["url"], title: hash["title"] } }
  end

  def self.create(url, title)
    return false unless is_url?(url)
    DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}')")
  end

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = #{id};")
  end

  def self.update(id, address, title)
    DatabaseConnection.query("UPDATE bookmarks SET url='#{address}', title='#{title}' WHERE id = #{id};")
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end



end
