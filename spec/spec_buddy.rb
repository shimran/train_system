require('rspec')
require('pry')
require('pg')
require('station')
require('train')

DB = PG.connect({:dbname=>"train_test"})

RSpec.configure do |config|
    config.after(:each) do
    DB.exec("DELETE FROM train *;")
    DB.exec("DELETE FROM station *;")
  end
end
