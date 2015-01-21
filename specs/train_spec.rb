require('rspec')
require('stop')
require('train')
require('pry')
require('pg')

DB = PG.connect({:dbname=>'train_test'})

    RSpec.configure do |config|
      config.after(:each) do
      DB.exec("DELETE FROM trains *;")
    end
  end

describe(Train) do

  describe("#express?") do
    it('checks to see if train is running express') do
      test_train=Train.new(:name => "Red",:direction => "North", :express? =>True, :id => nil)
      expect(test_train.express?()).to(eq(True))
    end
  end


end
