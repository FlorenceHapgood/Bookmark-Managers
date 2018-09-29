require 'database_connection'

RSpec.describe DatabaseConnection do

  describe '#setup' do
    it 'sets up a connection to the database' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      DatabaseConnection.setup('bookmark_manager_test')
    end

    it 'this connection is persistent' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(DatabaseConnection.connection).to eq connection #so this checks that the connection
      # is stored as a variable and we can access it throughout our class, most importantly with query. 
    end
  end

  describe '#query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('bookmark_manager_test')

      expect(connection).to receive(:exec).with("SELECT * FROM bookmarks;")

      DatabaseConnection.query("SELECT * FROM bookmarks;")
    end
  end
end
