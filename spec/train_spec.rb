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
end
