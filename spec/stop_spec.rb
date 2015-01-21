require('spec_buddy')

describe(Stop) do

  describe(".all") do
    it('is empty at first') do
      expect(Stop.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves each new station to the table') do
      test_stop = Stop.new({:station_id => 1, :train_id => 2})
      test_stop.save()
      expect(Stop.all()).to(eq([test_stop]))
    end
  end

  describe('#==') do
    it('is the same stop if it has the same train and station IDs') do
      stop1 = Stop.new({:station_id => 1, :train_id => 3})
      stop2 = Stop.new({:station_id => 1, :train_id => 3})
      expect(stop1).to(eq(stop2))
    end
  end

end
