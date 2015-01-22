require('spec_buddy')

describe(Station) do

  describe(".all") do
    it('is empty at first') do
      expect(Station.all()).to(eq([]))
    end
  end


  describe('#name') do
    it('returns the name of the station') do
    test_station= Station.new(:name => "Maynardville", :id => nil)
    expect(test_station.name()).to(eq("Maynardville"))
    end
  end

  describe('#id') do
    it ('returns the station iD of station') do
      test_station = Station.new(:name => "Maynardville", :id => nil)
      test_station.save()
      expect(test_station.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#save')do
    it('saves each new station to the table') do
      test_station = Station.new({:name => "ShimCity", :id => nil})
      test_station.save()
      expect(Station.all()).to(eq([test_station]))
    end
  end

  describe('#==') do
    it("is the same station if it has the same name and ID") do
      station1 = Station.new({:name => "ShimCity", :id => 1})
      station2 = Station.new({:name => "ShimCity", :id => 1})
      expect(station1).to(eq(station2))
    end
  end


end
