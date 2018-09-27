require './lib/bookmark'

describe Bookmark do
  describe '#all' do
    it "returns all bookmarks" do
      connection = PG.connect(dbname: "bookmark_manager_test")
      connection.exec("INSERT INTO bookmarks (URL) VALUES ('http://www.makersacademy.com');")
      bookmarks = Bookmark.all
      expect(bookmarks[0][:url]).to eq("http://www.makersacademy.com")
    end
  end

  describe "create" do
    it "stores a new bookmark" do
      Bookmark.create("http://www.testbookmark.com", 'TestBookmark') #didn't put in the url thing
      expect(Bookmark.all).to include({ url: "http://www.testbookmark.com", title: "TestBookmark" })
    end

    it "should return false if not real URL" do
      expect(Bookmark.create("gobbledy-gook", 'gobbledy-gook')).to equal false
    end
  end

end
