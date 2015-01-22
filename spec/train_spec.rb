require('spec_buddy')

describe(Train) do

  describe(".all") do
    it('is empty at first') do
      expect(Train.all()).to(eq([]))
    end
  end

  describe("#name") do
    it('returns the name of the train')do
    test_train = Train.new({:name => "Red", :direction => "North", :express => "t", :id => nil})
    expect(test_train.name()).to(eq("Red"))
    end
  end

  describe("#direction") do
    it('returns the direction of the train') do
      test_train = Train.new({:name => "Red", :direction => "North", :express => "t", :id => nil})
      expect(test_train.direction()).to(eq("North"))
    end
  end

  describe("#express") do
    it('checks to see if train is running express') do
      test_train=Train.new(:name => "Red",:direction => "North", :express => "t", :id => nil)
      expect(test_train.express()).to(eq("t"))
    end
  end

  describe('#save') do
    it('saves each new train to the table') do
      test_train=Train.new(:name => "Red", :direction => "North", :express => "t", :id => nil)
      test_train.save()
      expect(Train.all()).to(eq([test_train]))
    end
  end

  describe('#==') do
    it("is the same train if it has the same description and train ID") do
      train1 = Train.new({:name => "Red",:direction => "North", :express => "t" ,:id => 1})
      train2 = Train.new({:name => "Red", :direction => "North", :express => "t",:id => 1})
      expect(train1).to(eq(train2))
    end
  end


  # describe('#get_stations') do
  #   it('returns an array of station ids from a prompt "what stations are on the blue?"') do
  #     test_train = Train.new({:name =. "Blue", :direction => "North", :express => "f", :id => nil})
  #     station1 = Station.new({:name = "ShimCity", :id => nil})
  #     station2 = Station.new({:name = "Maynardville", :id => nil})
  #     station3 = Station.new({:name = "Jessicaburg", :id => nil})
  #     expect(test_train.get_stations()).to(eq([station1, station2]))
  #   end
  # end
end
