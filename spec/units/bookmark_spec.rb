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
      Bookmark.create("http://www.testbookmark.com", 'TestBookmark')
      expect(Bookmark.all).to include({ id: '1', url: "http://www.testbookmark.com", title: "TestBookmark" })
    end

    it "should return false if not real URL" do
      expect(Bookmark.create("gobbledy-gook", 'gobbledy-gook')).to equal false
    end
  end


  describe "delete" do
    it "deletes a bookmark" do
      Bookmark.create("http://www.testbookmark.com", 'TestBookmark')
      Bookmark.delete(1)
      expect(Bookmark.all).to eq([])
    end
  end

 describe "add_comment" do
   it "adds a comment" do
     Bookmark.create("http://www.testbookmark.com", "Test")
     Bookmark.add_comment(1, "comment")
     expect(Bookmark.get_comments(1)[0].values).to include("comment")
   end
 end

end
